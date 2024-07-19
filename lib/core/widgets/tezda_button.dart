import 'package:flutter/material.dart';
import 'package:tezda_test/core/widgets/tezda_loader.dart';

class TezdaButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onclick;
  final double? height;
  final double? width;
  final WidgetStateProperty<RoundedRectangleBorder> shape;
  final WidgetStateProperty<Color>? backgroundColor;
  final bool isLoading;
  const TezdaButton({
    super.key,
    required this.child,
    required this.onclick,
    required this.shape,
    this.backgroundColor,
    this.height,
    this.width,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 67,
      width: width ?? double.infinity,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: backgroundColor,
          shape: shape,
        ),
        onPressed: () => onclick(),
        child: isLoading ? const TezdaLoader() : child,
      ),
    );
  }
}
