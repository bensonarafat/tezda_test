// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'register_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// @nodoc
abstract class RegisterBlocType extends RxBlocTypeBase {
  RegisterBlocEvents get events;
  RegisterBlocStates get states;
}

/// [$RegisterBloc] extended by the [RegisterBloc]
/// @nodoc
abstract class $RegisterBloc extends RxBlocBase
    implements RegisterBlocEvents, RegisterBlocStates, RegisterBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [setEmail]
  final _$setEmailEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [setPassword]
  final _$setPasswordEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [setConfirmPassword]
  final _$setConfirmPasswordEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [register]
  final _$registerEvent = PublishSubject<void>();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<bool> _isLoadingState = _mapToIsLoadingState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<String> _errorsState = _mapToErrorsState();

  /// The state of [onRegistrationComplete] implemented in
  /// [_mapToOnRegistrationCompleteState]
  late final Stream<TezdaUser> _onRegistrationCompleteState =
      _mapToOnRegistrationCompleteState();

  /// The state of [isSubmitEnabled] implemented in [_mapToIsSubmitEnabledState]
  late final Stream<bool> _isSubmitEnabledState = _mapToIsSubmitEnabledState();

  /// The state of [email] implemented in [_mapToEmailState]
  late final Stream<String> _emailState = _mapToEmailState();

  /// The state of [errorEmail] implemented in [_mapToErrorEmailState]
  late final Stream<String?> _errorEmailState = _mapToErrorEmailState();

  /// The state of [password] implemented in [_mapToPasswordState]
  late final Stream<String> _passwordState = _mapToPasswordState();

  /// The state of [errorPassword] implemented in [_mapToErrorPasswordState]
  late final Stream<String?> _errorPasswordState = _mapToErrorPasswordState();

  /// The state of [errorConfirmPassword] implemented in
  /// [_mapToErrorConfirmPasswordState]
  late final Stream<String?> _errorConfirmPasswordState =
      _mapToErrorConfirmPasswordState();

  @override
  void setEmail(String email) => _$setEmailEvent.add(email);

  @override
  void setPassword(String password) => _$setPasswordEvent.add(password);

  @override
  void setConfirmPassword(String confirmPassword) =>
      _$setConfirmPasswordEvent.add(confirmPassword);

  @override
  void register() => _$registerEvent.add(null);

  @override
  Stream<bool> get isLoading => _isLoadingState;

  @override
  Stream<String> get errors => _errorsState;

  @override
  Stream<TezdaUser> get onRegistrationComplete => _onRegistrationCompleteState;

  @override
  Stream<bool> get isSubmitEnabled => _isSubmitEnabledState;

  @override
  Stream<String> get email => _emailState;

  @override
  Stream<String?> get errorEmail => _errorEmailState;

  @override
  Stream<String> get password => _passwordState;

  @override
  Stream<String?> get errorPassword => _errorPasswordState;

  @override
  Stream<String?> get errorConfirmPassword => _errorConfirmPasswordState;

  Stream<bool> _mapToIsLoadingState();

  Stream<String> _mapToErrorsState();

  Stream<TezdaUser> _mapToOnRegistrationCompleteState();

  Stream<bool> _mapToIsSubmitEnabledState();

  Stream<String> _mapToEmailState();

  Stream<String?> _mapToErrorEmailState();

  Stream<String> _mapToPasswordState();

  Stream<String?> _mapToErrorPasswordState();

  Stream<String?> _mapToErrorConfirmPasswordState();

  @override
  RegisterBlocEvents get events => this;

  @override
  RegisterBlocStates get states => this;

  @override
  void dispose() {
    _$setEmailEvent.close();
    _$setPasswordEvent.close();
    _$setConfirmPasswordEvent.close();
    _$registerEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
