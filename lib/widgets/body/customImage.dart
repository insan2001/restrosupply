import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class CustomImageWidget extends StatelessWidget {
  final String? path;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const CustomImageWidget(
      {super.key, required this.path, this.width, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: (path == "" || path == null) ? emptyImage : path!,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}
