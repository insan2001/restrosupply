import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class CustomImageWidget extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  const CustomImageWidget(
      {super.key, required this.path, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path == "" ? emptyImage : path,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorWidget: (context, error, stackTrace) => Image.asset(
        path == "" ? emptyImage : path,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
