import 'package:auto_route/auto_route.dart';
import 'package:tezda_test/core/routes/router.gr.dart';

@AutoRouterConfig(
    replaceInRouteName: 'Screen,Route', generateForDir: ['lib/screens'])
class AppRouter extends $AppRouter {
  AppRouter({super.navigatorKey});

  @override
  RouteType get defaultRouteType =>
      const RouteType.custom(transitionsBuilder: TransitionsBuilders.slideLeft);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SplashRoute.page, initial: true),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/register', page: RegisterRoute.page),
        AutoRoute(path: '/product', page: ProductRoute.page),
        AutoRoute(path: '/home', page: HomeRoute.page),
        AutoRoute(path: '/error', page: ErrorRoute.page),
        AutoRoute(path: '/confirm', page: ConfirmRoute.page),
        AutoRoute(path: '/profile', page: ProfileRoute.page),
      ];
}
