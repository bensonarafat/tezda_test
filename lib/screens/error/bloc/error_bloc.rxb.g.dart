// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'error_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// @nodoc
abstract class ErrorBlocType extends RxBlocTypeBase {
  ErrorBlocEvents get events;
  ErrorBlocStates get states;
}

/// [$ErrorBloc] extended by the [ErrorBloc]
/// @nodoc
abstract class $ErrorBloc extends RxBlocBase
    implements ErrorBlocEvents, ErrorBlocStates, ErrorBlocType {
  final _compositeSubscription = CompositeSubscription();

  @override
  ErrorBlocEvents get events => this;

  @override
  ErrorBlocStates get states => this;

  @override
  void dispose() {
    _compositeSubscription.dispose();
    super.dispose();
  }
}
