// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'confirm_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// @nodoc
abstract class ConfirmBlocType extends RxBlocTypeBase {
  ConfirmBlocEvents get events;
  ConfirmBlocStates get states;
}

/// [$ConfirmBloc] extended by the [ConfirmBloc]
/// @nodoc
abstract class $ConfirmBloc extends RxBlocBase
    implements ConfirmBlocEvents, ConfirmBlocStates, ConfirmBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [refresh]
  final _$refreshEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [signOut]
  final _$signOutEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [doOver]
  final _$doOverEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [sendEmail]
  final _$sendEmailEvent = PublishSubject<void>();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<bool> _isLoadingState = _mapToIsLoadingState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<String> _errorsState = _mapToErrorsState();

  /// The state of [currentUser] implemented in [_mapToCurrentUserState]
  late final Stream<Result<TezdaUser>> _currentUserState =
      _mapToCurrentUserState();

  /// The state of [onEmailSent] implemented in [_mapToOnEmailSentState]
  late final Stream<String> _onEmailSentState = _mapToOnEmailSentState();

  /// The state of [onSignout] implemented in [_mapToOnSignoutState]
  late final Stream<bool> _onSignoutState = _mapToOnSignoutState();

  /// The state of [onDoOver] implemented in [_mapToOnDoOverState]
  late final Stream<bool> _onDoOverState = _mapToOnDoOverState();

  @override
  void refresh() => _$refreshEvent.add(null);

  @override
  void signOut() => _$signOutEvent.add(null);

  @override
  void doOver() => _$doOverEvent.add(null);

  @override
  void sendEmail() => _$sendEmailEvent.add(null);

  @override
  Stream<bool> get isLoading => _isLoadingState;

  @override
  Stream<String> get errors => _errorsState;

  @override
  Stream<Result<TezdaUser>> get currentUser => _currentUserState;

  @override
  Stream<String> get onEmailSent => _onEmailSentState;

  @override
  Stream<bool> get onSignout => _onSignoutState;

  @override
  Stream<bool> get onDoOver => _onDoOverState;

  Stream<bool> _mapToIsLoadingState();

  Stream<String> _mapToErrorsState();

  Stream<Result<TezdaUser>> _mapToCurrentUserState();

  Stream<String> _mapToOnEmailSentState();

  Stream<bool> _mapToOnSignoutState();

  Stream<bool> _mapToOnDoOverState();

  @override
  ConfirmBlocEvents get events => this;

  @override
  ConfirmBlocStates get states => this;

  @override
  void dispose() {
    _$refreshEvent.close();
    _$signOutEvent.close();
    _$doOverEvent.close();
    _$sendEmailEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
