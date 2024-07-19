// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:tezda_test/core/models/product.dart' as _i11;
import 'package:tezda_test/screens/confirm/confirm_screen.dart' as _i1;
import 'package:tezda_test/screens/error/error_screen.dart' as _i2;
import 'package:tezda_test/screens/home/home_screen.dart' as _i3;
import 'package:tezda_test/screens/login/login_screen.dart' as _i4;
import 'package:tezda_test/screens/product/product_screen.dart' as _i5;
import 'package:tezda_test/screens/profile/profile_screen.dart' as _i6;
import 'package:tezda_test/screens/register/register_screen.dart' as _i7;
import 'package:tezda_test/screens/splash/splash_screen.dart' as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    ConfirmRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i1.ConfirmScreen()),
      );
    },
    ErrorRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i2.ErrorScreen()),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i3.HomeScreen()),
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i4.LoginScreen()),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(
            child: _i5.ProductScreen(
          key: args.key,
          product: args.product,
        )),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i6.ProfileScreen()),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i7.RegisterScreen()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i8.SplashScreen()),
      );
    },
  };
}

/// generated route for
/// [_i1.ConfirmScreen]
class ConfirmRoute extends _i9.PageRouteInfo<void> {
  const ConfirmRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ErrorScreen]
class ErrorRoute extends _i9.PageRouteInfo<void> {
  const ErrorRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ErrorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProductScreen]
class ProductRoute extends _i9.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i10.Key? key,
    required _i11.Product product,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const _i9.PageInfo<ProductRouteArgs> page =
      _i9.PageInfo<ProductRouteArgs>(name);
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.product,
  });

  final _i10.Key? key;

  final _i11.Product product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RegisterScreen]
class RegisterRoute extends _i9.PageRouteInfo<void> {
  const RegisterRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
