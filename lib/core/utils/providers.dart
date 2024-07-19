import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tezda_test/core/datasource/remote/api.dart';
import 'package:tezda_test/core/datasource/repositories/auth_repository.dart';
import 'package:tezda_test/core/datasource/repositories/product_repository.dart';
import 'package:tezda_test/core/datasource/repositories/user_repository.dart';
import 'package:tezda_test/core/datasource/services/product_service.dart';
import 'package:tezda_test/core/datasource/services/user_service.dart';
import 'package:tezda_test/core/utils/shared_preference.dart';
import 'package:tezda_test/screens/home/bloc/home_bloc.dart';

abstract class Providers {
  static final userSession = UserSession();
  static final apiDataSource = ApiDataSource();

  static final List<SingleChildWidget> _independentProviders = [
    Provider<UserSession>.value(value: userSession),
    Provider<UserServices>.value(value: UserServices()),
    Provider<ProductService>.value(
      value: ProductService(apiDataSource),
    )
  ];

  static final List<SingleChildWidget> _apiProviders = [];

  static final List<SingleChildWidget> _repositoryProviders = [
    Provider<AuthRepository>.value(value: AuthRepositoryImpl()),
    ProxyProvider<UserServices, UserRepository>(
      update: (context, userService, _) => UserRepository(
        userService,
      ),
    ),
    ProxyProvider<ProductService, ProductRepository>(
      update: (context, productService, _) =>
          ProductRepositoryImpl(productService),
    ),
  ];

  static final List<SingleChildWidget> _blocProviders = [
    ProxyProvider2<AuthRepository, ProductRepository, HomeBlocType>(
      update: (_, authrepository, productRepository, __) =>
          HomeBloc(authrepository, productRepository),
    ),
  ];

  static List<SingleChildWidget> providers = [
    ..._independentProviders,
    ..._apiProviders,
    ..._repositoryProviders,
    ..._blocProviders
  ];
}
