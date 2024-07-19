// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'splash_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// @nodoc
abstract class SplashBlocType extends RxBlocTypeBase {
  SplashBlocEvents get events;
  SplashBlocStates get states;
}

/// [$SplashBloc] extended by the [SplashBloc]
/// @nodoc
abstract class $SplashBloc extends RxBlocBase
    implements SplashBlocEvents, SplashBlocStates, SplashBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<bool> _isLoadingState = _mapToIsLoadingState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<String> _errorsState = _mapToErrorsState();

  /// The state of [openHomeOrConfirmation] implemented in
  /// [_mapToOpenHomeOrConfirmationState]
  late final Stream<TezdaUser> _openHomeOrConfirmationState =
      _mapToOpenHomeOrConfirmationState();

  /// The state of [openLogin] implemented in [_mapToOpenLoginState]
  late final Stream<bool> _openLoginState = _mapToOpenLoginState();

  @override
  Stream<bool> get isLoading => _isLoadingState;

  @override
  Stream<String> get errors => _errorsState;

  @override
  Stream<TezdaUser> get openHomeOrConfirmation => _openHomeOrConfirmationState;

  @override
  Stream<bool> get openLogin => _openLoginState;

  Stream<bool> _mapToIsLoadingState();

  Stream<String> _mapToErrorsState();

  Stream<TezdaUser> _mapToOpenHomeOrConfirmationState();

  Stream<bool> _mapToOpenLoginState();

  @override
  SplashBlocEvents get events => this;

  @override
  SplashBlocStates get states => this;

  @override
  void dispose() {
    _compositeSubscription.dispose();
    super.dispose();
  }
}
