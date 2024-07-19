// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'home_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// @nodoc
abstract class HomeBlocType extends RxBlocTypeBase {
  HomeBlocEvents get events;
  HomeBlocStates get states;
}

/// [$HomeBloc] extended by the [HomeBloc]
/// @nodoc
abstract class $HomeBloc extends RxBlocBase
    implements HomeBlocEvents, HomeBlocStates, HomeBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [fetchProducts]
  final _$fetchProductsEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [signOut]
  final _$signOutEvent = PublishSubject<void>();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<bool> _isLoadingState = _mapToIsLoadingState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<String> _errorsState = _mapToErrorsState();

  /// The state of [currentUser] implemented in [_mapToCurrentUserState]
  late final Stream<TezdaUser> _currentUserState = _mapToCurrentUserState();

  /// The state of [products] implemented in [_mapToProductsState]
  late final Stream<Result<List<Product>>> _productsState =
      _mapToProductsState();

  /// The state of [onSignout] implemented in [_mapToOnSignoutState]
  late final Stream<bool> _onSignoutState = _mapToOnSignoutState();

  @override
  void fetchProducts() => _$fetchProductsEvent.add(null);

  @override
  void signOut() => _$signOutEvent.add(null);

  @override
  Stream<bool> get isLoading => _isLoadingState;

  @override
  Stream<String> get errors => _errorsState;

  @override
  Stream<TezdaUser> get currentUser => _currentUserState;

  @override
  Stream<Result<List<Product>>> get products => _productsState;

  @override
  Stream<bool> get onSignout => _onSignoutState;

  Stream<bool> _mapToIsLoadingState();

  Stream<String> _mapToErrorsState();

  Stream<TezdaUser> _mapToCurrentUserState();

  Stream<Result<List<Product>>> _mapToProductsState();

  Stream<bool> _mapToOnSignoutState();

  @override
  HomeBlocEvents get events => this;

  @override
  HomeBlocStates get states => this;

  @override
  void dispose() {
    _$fetchProductsEvent.close();
    _$signOutEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
