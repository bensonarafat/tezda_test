import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:tezda_test/core/models/product.dart';
import 'package:tezda_test/core/widgets/tezda_product_card.dart';
import 'package:tezda_test/screens/product/bloc/product_bloc.dart';

@RoutePage()
class ProductScreen extends StatelessWidget implements AutoRouteWrapper {
  final Product product;
  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ProductCard(product: product),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => RxBlocProvider<ProductBlocType>(
        create: (context) => ProductBloc(),
        child: this,
      );
}
