import 'package:flutter/material.dart';

class isDevice extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  const isDevice({super.key, required this.mobile, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (MediaQuery.of(context).size.width <= 480) {
          return mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
