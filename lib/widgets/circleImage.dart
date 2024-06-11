import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String imgUrl;
  final double size;
  const CircleImage({super.key, required this.imgUrl, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: size,
      width: size,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
