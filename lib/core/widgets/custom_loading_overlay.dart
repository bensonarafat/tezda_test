import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'tezda_loading_overlay.dart';

// Customized version of the general overlay that displays the spinning circle during loads

class CustomLoadingOverLay extends TezdaLoadingOverlay {
  const CustomLoadingOverLay({
    super.key,
    required super.isLoading,
    required super.child,
  }) : super(
            progressIndicator: const SpinKitCircle(
          color: Colors.yellow,
          size: 80.0,
        ));

  static Widget loadingWidget() {
    return const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: SpinKitFadingCircle(color: Colors.yellow, size: 80.0),
      ),
    ]);
  }
}
