import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class CustomImageWidget extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  const CustomImageWidget(
      {super.key,
      required this.path,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      path == "" ? emptyImage : path,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Image.asset(
        path == "" ? emptyImage : path,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
