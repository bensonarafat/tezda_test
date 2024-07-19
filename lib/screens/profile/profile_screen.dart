import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tezda_test/core/models/user.dart';
import 'package:tezda_test/core/resources/assets.dart';
import 'package:tezda_test/screens/profile/bloc/profile_bloc.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProfileScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => RxBlocProvider<ProfileBlocType>(
        create: (context) => ProfileBloc(
          Provider.of(context, listen: false),
        ),
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: RxResultBuilder<ProfileBlocType, TezdaUser>(
        buildLoading: (context, bloc) =>
            const Center(child: CircularProgressIndicator()),
        state: (bloc) => bloc.states.currentUser,
        buildError: (context, error, bloc) => const Text("Error"),
        buildSuccess: (context, user, bloc) {
          return Column(
            children: [
              Center(
                child: Image.asset(
                  Assets.avatar,
                ),
              ),
              Text(
                user.email ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
