import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tezda_test/core/datasource/repositories/auth_repository.dart';
import 'package:tezda_test/core/datasource/repositories/product_repository.dart';
import 'package:tezda_test/core/models/product.dart';
import 'package:tezda_test/core/models/user.dart';

part 'home_bloc.rxb.g.dart';

abstract class HomeBlocEvents {
  void fetchProducts();
  void signOut();
}

abstract class HomeBlocStates {
  Stream<bool> get isLoading;

  Stream<String> get errors;

  Stream<TezdaUser> get currentUser;

  Stream<Result<List<Product>>> get products;

  Stream<bool> get onSignout;
}

@RxBloc()
class HomeBloc extends $HomeBloc {
  final AuthRepository _authRepository;
  final ProductRepository _productRepository;

  HomeBloc(
    this._authRepository,
    this._productRepository,
  );

  @override
  Stream<Result<List<Product>>> _mapToProductsState() =>
      _productRepository.getProducts().asResultStream();

  @override
  Stream<TezdaUser> _mapToCurrentUserState() => _authRepository.currentUser;

  @override
  Stream<String> _mapToErrorsState() =>
      errorState.map((error) => error.toString());

  @override
  Stream<bool> _mapToOnSignoutState() =>
      _$signOutEvent.switchMap((value) => _authRepository.signOut().asStream());

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;
}
