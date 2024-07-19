// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'login_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// @nodoc
abstract class LoginBlocType extends RxBlocTypeBase {
  LoginBlocEvents get events;
  LoginBlocStates get states;
}

/// [$LoginBloc] extended by the [LoginBloc]
/// @nodoc
abstract class $LoginBloc extends RxBlocBase
    implements LoginBlocEvents, LoginBlocStates, LoginBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [setEmail]
  final _$setEmailEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [setPassword]
  final _$setPasswordEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [login]
  final _$loginEvent = PublishSubject<void>();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<bool> _isLoadingState = _mapToIsLoadingState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<String> _errorsState = _mapToErrorsState();

  /// The state of [errorEmail] implemented in [_mapToErrorEmailState]
  late final Stream<String?> _errorEmailState = _mapToErrorEmailState();

  /// The state of [errorPassword] implemented in [_mapToErrorPasswordState]
  late final Stream<String?> _errorPasswordState = _mapToErrorPasswordState();

  /// The state of [isLoginEnabled] implemented in [_mapToIsLoginEnabledState]
  late final Stream<bool> _isLoginEnabledState = _mapToIsLoginEnabledState();

  /// The state of [loginComplete] implemented in [_mapToLoginCompleteState]
  late final Stream<TezdaUser> _loginCompleteState = _mapToLoginCompleteState();

  @override
  void setEmail(String email) => _$setEmailEvent.add(email);

  @override
  void setPassword(String password) => _$setPasswordEvent.add(password);

  @override
  void login() => _$loginEvent.add(null);

  @override
  Stream<bool> get isLoading => _isLoadingState;

  @override
  Stream<String> get errors => _errorsState;

  @override
  Stream<String?> get errorEmail => _errorEmailState;

  @override
  Stream<String?> get errorPassword => _errorPasswordState;

  @override
  Stream<bool> get isLoginEnabled => _isLoginEnabledState;

  @override
  Stream<TezdaUser> get loginComplete => _loginCompleteState;

  Stream<bool> _mapToIsLoadingState();

  Stream<String> _mapToErrorsState();

  Stream<String?> _mapToErrorEmailState();

  Stream<String?> _mapToErrorPasswordState();

  Stream<bool> _mapToIsLoginEnabledState();

  Stream<TezdaUser> _mapToLoginCompleteState();

  @override
  LoginBlocEvents get events => this;

  @override
  LoginBlocStates get states => this;

  @override
  void dispose() {
    _$setEmailEvent.close();
    _$setPasswordEvent.close();
    _$loginEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
