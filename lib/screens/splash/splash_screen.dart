import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tezda_test/core/models/user.dart';
import 'package:tezda_test/core/widgets/login_common_view.dart';
import 'package:tezda_test/screens/login/login_screen.dart';
import 'package:tezda_test/screens/splash/bloc/splash_bloc.dart';

@RoutePage()
class SplashScreen extends StatelessWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[7000],
      child: Stack(
        children: <Widget>[
          const Align(
            alignment: Alignment.center,
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          ),
          RxBlocListener<SplashBlocType, dynamic>(
            state: (bloc) => bloc.states.openLogin,
            listener: (context, snapshot) {
              LoginScreen.showView(context);
            },
          ),
          RxBlocListener<SplashBlocType, TezdaUser>(
            state: (bloc) => bloc.states.openHomeOrConfirmation,
            listener: LoginCommonView.confirmEmailRoute,
          ),
        ],
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => RxBlocProvider<SplashBlocType>(
        create: (context) => SplashBloc(Provider.of(context, listen: false)),
        child: this,
      );
}
