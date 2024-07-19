import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:tezda_test/screens/error/bloc/error_bloc.dart';

@RoutePage()
class ErrorScreen extends StatelessWidget implements AutoRouteWrapper {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  Widget wrappedRoute(BuildContext context) => RxBlocProvider<ErrorBlocType>(
        create: (context) => ErrorBloc(),
        child: this,
      );
}
