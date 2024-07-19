import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tezda_test/core/datasource/repositories/auth_repository.dart';
import 'package:tezda_test/core/models/user.dart';

part 'confirm_bloc.rxb.g.dart';

abstract class ConfirmBlocEvents {
  void refresh();

  void signOut();

  void doOver();

  void sendEmail();
}

abstract class ConfirmBlocStates {
  Stream<bool> get isLoading;

  Stream<String> get errors;

  Stream<Result<TezdaUser>> get currentUser;

  Stream<String> get onEmailSent;

  Stream<bool> get onSignout;

  Stream<bool> get onDoOver;
}

@RxBloc()
class ConfirmBloc extends $ConfirmBloc {
  final AuthRepository _authRepository;

  ConfirmBloc(this._authRepository);
  @override
  Stream<Result<TezdaUser>> _mapToCurrentUserState() =>
      _authRepository.currentUser.asResultStream();

  @override
  Stream<String> _mapToErrorsState() =>
      errorState.map((error) => error.toString());

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;

  @override
  Stream<bool> _mapToOnDoOverState() => _$doOverEvent
          .switchMap((value) => _authRepository.firebaseUser.asResultStream())
          .whereSuccess()
          .map((user) {
        signOut();
        return true;
      });

  @override
  Stream<String> _mapToOnEmailSentState() => _$sendEmailEvent
      .withLatestFrom(_authRepository.currentUser, (t, s) => s)
      .switchMap((TezdaUser user) async* {
        yield Result<String>.loading();
        try {
          await _authRepository.sendMail();
          yield Result<String>.success(
              "We’ve sent a verification email to ${user.email} Please check your inbox.");
        } catch (err) {
          yield Result<String>.success(err.toString());
        }
      })
      .setResultStateHandler(this)
      .whereSuccess();

  @override
  Stream<bool> _mapToOnSignoutState() =>
      _$signOutEvent.switchMap((value) => _authRepository.signOut().asStream());
}
