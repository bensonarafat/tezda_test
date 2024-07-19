import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tezda_test/core/models/product.dart';
import 'package:tezda_test/core/resources/assets.dart';
import 'package:tezda_test/core/routes/router.gr.dart';
import 'package:tezda_test/core/widgets/tezda_product_card.dart';
import 'package:tezda_test/screens/home/bloc/home_bloc.dart';
import 'package:tezda_test/screens/login/login_screen.dart';

@RoutePage()
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  static show(BuildContext context) {
    context.router.replace(const HomeRoute());
  }

  @override
  Widget wrappedRoute(BuildContext context) => RxBlocProvider<HomeBlocType>(
        create: (context) => HomeBloc(
          Provider.of(context, listen: false),
          Provider.of(context, listen: false),
        ),
        child: this,
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.router.push(const ProfileRoute()),
          child: Image.asset(
            Assets.avatar,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                RxBlocProvider.of<HomeBlocType>(context).events.signOut(),
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          RxResultBuilder<HomeBlocType, List<Product>>(
            buildLoading: (context, bloc) =>
                const Center(child: CircularProgressIndicator()),
            state: (bloc) => bloc.states.products,
            buildError: (context, error, bloc) => const Text("Error"),
            buildSuccess: (context, products, bloc) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(product: products[index]);
                  });
            },
          ),
          RxBlocListener<HomeBlocType, bool>(
            state: (bloc) => bloc.states.onSignout,
            listener: (_, bool signOut) {
              if (signOut == true) {
                LoginScreen.showView(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
