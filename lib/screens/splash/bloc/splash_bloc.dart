import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tezda_test/core/datasource/repositories/auth_repository.dart';
import 'package:tezda_test/core/models/user.dart';

part 'splash_bloc.rxb.g.dart';

abstract class SplashBlocEvents {}

abstract class SplashBlocStates {
  /// The loading state
  Stream<bool> get isLoading;

  Stream<String> get errors;

  Stream<TezdaUser> get openHomeOrConfirmation;

  Stream<bool> get openLogin;
}

@RxBloc()
class SplashBloc extends $SplashBloc {
  final AuthRepository _repository;
  final _profileStream = BehaviorSubject<TezdaUser?>();
  final _sessionStream = BehaviorSubject<bool?>();

  SplashBloc(this._repository) {
    _repository
        .autoLogin()
        .where((event) {
          _sessionStream.add(event);
          return event == true;
        })
        .switchMap((value) => _repository.restoreSession())
        .shareReplay(maxSize: 1)
        .listen((TezdaUser? user) {
          _profileStream.add(user);
        });
  }

  @override
  Stream<String> _mapToErrorsState() =>
      errorState.map((error) => error.toString());

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;

  @override
  Stream<bool> _mapToOpenLoginState() {
    return _sessionStream.where((event) => event != true).map((event) => true);
  }

  @override
  Stream<TezdaUser> _mapToOpenHomeOrConfirmationState() =>
      _profileStream.whereNotNull();
}
