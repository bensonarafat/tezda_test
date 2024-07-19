import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tezda_test/core/datasource/repositories/auth_repository.dart';
import 'package:tezda_test/core/datasource/repositories/user_repository.dart';
import 'package:tezda_test/core/models/user.dart';
import 'package:tezda_test/screens/register/validator/login_validator.dart';

part 'register_bloc.rxb.g.dart';

abstract class RegisterBlocEvents {
  void setEmail(String email);

  void setPassword(String password);

  void setConfirmPassword(String confirmPassword);

  void register();
}

abstract class RegisterBlocStates {
  Stream<bool> get isLoading;

  /// The error state
  Stream<String> get errors;

  Stream<TezdaUser> get onRegistrationComplete;

  Stream<bool> get isSubmitEnabled;

  // Email
  Stream<String> get email;

  Stream<String?> get errorEmail;

  // Password
  Stream<String> get password;

  Stream<String?> get errorPassword;

  Stream<String?> get errorConfirmPassword;
}

@RxBloc()
class RegisterBloc extends $RegisterBloc {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  final _validator = LoginValidator();

  RegisterBloc(this._authRepository, this._userRepository);

  @override
  Stream<String> _mapToErrorsState() =>
      errorState.map((error) => error.toString());

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;

  Stream<String?> get validateEmailAddress => CombineLatestStream.list([
        errorEmail,
      ]).map((errorMessages) {
        bool hasNoError = errorMessages
            .every((element) => (element == null || element.isEmpty));
        return hasNoError
            ? null
            : "error"; // null means user can submit & buttons are enabled.
      }).share();

  @override
  Stream<bool> get isSubmitEnabled => CombineLatestStream.list([
        validateEmailAddress,
        errorPassword,
      ])
          .map((errorMessages) => errorMessages
              .every((element) => (element == null || element.isEmpty)))
          .share();

  @override
  Stream<String?> _mapToErrorEmailState() =>
      email.map((email) => _validator.validateEmail(email)).share();

  @override
  Stream<String> _mapToEmailState() => _$setEmailEvent.shareReplay();

  @override
  Stream<String?> _mapToErrorPasswordState() => password
      .map((value) => _validator.validatePassword(value))
      .share(); // share() converts the current Stream into a new Stream that can be listened to multiple times. It will automatically begin emitting items when first listened to, and shut down when no listeners remain. In this case selections state is listened to by _mapToIsSubmitEnabledState (another piece of bloc code) & account_form.dart (widget code).

  @override
  Stream<bool> _mapToIsSubmitEnabledState() => CombineLatestStream.list([
        validateEmailAddress,
        errorPassword,
      ])
          .map((errorMessages) => errorMessages
              .every((element) => (element == null || element.isEmpty)))
          .share();

  @override
  Stream<TezdaUser> _mapToOnRegistrationCompleteState() => _$registerEvent
      .withLatestFrom2(email, password, (t, String email, String password) {
        return TezdaUser(
          email: email,
          password: password,
        );
      })
      .switchMap((TezdaUser user) => _authRepository
          .register(user.email!, user.password!)
          .asResultStream())
      .setResultStateHandler(this)
      .whereSuccess()
      .whereNotNull()
      .map((user) {
        TezdaUser newUser = TezdaUser(
          uid: user.uid,
          email: user.email,
        );
        newUser.emailVerified = user.emailVerified;

        return newUser;
      })
      .switchMap((TezdaUser newUser) async* {
        yield Result<TezdaUser>.loading();
        await _userRepository.insertUser(newUser);

        yield Result.success(newUser);
      })
      .setResultStateHandler(this)
      .whereSuccess()
      .switchMap((value) => _authRepository.login(value.userId))
      .whereSuccess();

  @override
  Stream<String> _mapToPasswordState() => _$setPasswordEvent.shareReplay();

  @override
  Stream<String?> _mapToErrorConfirmPasswordState() =>
      _$setConfirmPasswordEvent.withLatestFrom(
          _$setPasswordEvent,
          (String? value, String? password) =>
              _validator.validateConfirmPassword(password, value));
}
