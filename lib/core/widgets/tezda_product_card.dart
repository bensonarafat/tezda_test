import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tezda_test/core/models/product.dart';
import 'package:tezda_test/core/routes/router.gr.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _hasError = false;
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    List<dynamic> images = jsonDecode(widget.product.images.first);

    return LayoutBuilder(builder: (BuildContext context, BoxConstraints box) {
      return GestureDetector(
        onTap: () => context.router.push(ProductRoute(product: widget.product)),
        child: Card(
          child: Column(
            children: [
              Container(
                height: box.maxHeight / 1.9,
                width: box.maxWidth,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  image: DecorationImage(
                    onError: (context, _) {
                      setState(() {
                        _hasError = true;
                      });
                    },
                    image: _hasError
                        ? const NetworkImage("https://i.imgur.com/1twoaDy.jpeg")
                        : NetworkImage(images.first),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      widget.product.title,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${widget.product.price}",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLike = !isLike;
                            });
                          },
                          child: isLike
                              ? const FaIcon(
                                  FontAwesomeIcons.heartCircleCheck,
                                  color: Colors.red,
                                )
                              : const FaIcon(FontAwesomeIcons.heart),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
