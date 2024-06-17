import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

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
        if (MediaQuery.of(context).size.width > mobileWidth) {
          return desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}
