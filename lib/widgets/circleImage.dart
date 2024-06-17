import 'package:flutter/material.dart';
import 'package:restrosupply/widgets/body/customImage.dart';

class CircleImage extends StatelessWidget {
  final String path;
  final double size;
  const CircleImage({super.key, required this.path, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: CustomImageWidget(
        path: path,
        height: size,
        width: size,
      ),
    );
  }
}
