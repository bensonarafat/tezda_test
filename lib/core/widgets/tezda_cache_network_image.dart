import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tezda_test/core/resources/assets.dart';

class TezdaCacheNetWorkImage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  const TezdaCacheNetWorkImage({
    super.key,
    required this.url,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return Container();
    } else {
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: url!,
          width: width,
          height: height,
          placeholder: (context, url) => Image.asset(Assets.loadingPlaceholder),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      );
    }
  }
}
