import 'package:flutter/material.dart';

class isDevice extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  const isDevice({
    super.key,
    this.mobile = const SizedBox(),
    this.desktop = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 750) {
          return desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}
