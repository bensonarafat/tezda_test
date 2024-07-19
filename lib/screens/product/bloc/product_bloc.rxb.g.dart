// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'product_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// @nodoc
abstract class ProductBlocType extends RxBlocTypeBase {
  ProductBlocEvents get events;
  ProductBlocStates get states;
}

/// [$ProductBloc] extended by the [ProductBloc]
/// @nodoc
abstract class $ProductBloc extends RxBlocBase
    implements ProductBlocEvents, ProductBlocStates, ProductBlocType {
  final _compositeSubscription = CompositeSubscription();

  @override
  ProductBlocEvents get events => this;

  @override
  ProductBlocStates get states => this;

  @override
  void dispose() {
    _compositeSubscription.dispose();
    super.dispose();
  }
}
