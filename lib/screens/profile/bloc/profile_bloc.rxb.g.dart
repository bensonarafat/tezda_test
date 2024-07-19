// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'profile_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// @nodoc
abstract class ProfileBlocType extends RxBlocTypeBase {
  ProfileEvents get events;
  ProfileStates get states;
}

/// [$ProfileBloc] extended by the [ProfileBloc]
/// @nodoc
abstract class $ProfileBloc extends RxBlocBase
    implements ProfileEvents, ProfileStates, ProfileBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// The state of [currentUser] implemented in [_mapToCurrentUserState]
  late final Stream<Result<TezdaUser>> _currentUserState =
      _mapToCurrentUserState();

  @override
  Stream<Result<TezdaUser>> get currentUser => _currentUserState;

  Stream<Result<TezdaUser>> _mapToCurrentUserState();

  @override
  ProfileEvents get events => this;

  @override
  ProfileStates get states => this;

  @override
  void dispose() {
    _compositeSubscription.dispose();
    super.dispose();
  }
}
