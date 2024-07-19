import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TezdaLoader extends StatelessWidget {
  final Color color;
  const TezdaLoader({super.key, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      color: color,
    );
  }
}
