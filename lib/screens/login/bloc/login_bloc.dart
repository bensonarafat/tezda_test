import 'package:firebase_auth/firebase_auth.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tezda_test/core/datasource/repositories/auth_repository.dart';
import 'package:tezda_test/core/models/user.dart';
import 'package:tezda_test/screens/register/validator/login_validator.dart';

part 'login_bloc.rxb.g.dart';

abstract class LoginBlocEvents {
  void setEmail(String email);
  void setPassword(String password);
  void login();
}

abstract class LoginBlocStates {
  Stream<bool> get isLoading;
  Stream<String> get errors;
  Stream<String?> get errorEmail;
  Stream<String?> get errorPassword;

  Stream<bool> get isLoginEnabled;
  Stream<TezdaUser> get loginComplete;
}

@RxBloc()
class LoginBloc extends $LoginBloc {
  final AuthRepository _authRepository;
  final _validator = LoginValidator();
  LoginBloc(this._authRepository);

  @override
  Stream<String> _mapToErrorsState() =>
      errorState.map((Exception error) => error.toString());

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;

  @override
  Stream<String?> _mapToErrorEmailState() =>
      _$setEmailEvent.map((email) => _validator.validateEmail(email)).share();

  @override
  Stream<String?> _mapToErrorPasswordState() => _$setPasswordEvent
      .map((value) => _validator.validatePassword(value))
      .share();

  @override
  Stream<bool> _mapToIsLoginEnabledState() =>
      CombineLatestStream.list([errorEmail, errorPassword])
          .map((errorMessages) => errorMessages
              .every((element) => (element == null || element.isEmpty)))
          .share();

  @override
  Stream<TezdaUser> _mapToLoginCompleteState() => _$loginEvent
      .withLatestFrom2(_$setEmailEvent, _$setPasswordEvent,
          (t, String email, String password) => LoginDto(email, password))
      .switchMap((LoginDto loginDto) {
        return _authRepository
            .authenticate(loginDto.email, loginDto.password)
            .asResultStream();
      })
      .setResultStateHandler(this)
      .whereSuccess()
      .switchMap((User firebaseUser) => _authRepository.login(firebaseUser.uid))
      .setResultStateHandler(this)
      .whereSuccess();
}

class LoginDto {
  String email, password;
  LoginDto(this.email, this.password);
}
