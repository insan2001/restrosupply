import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String path;
  final double size;
  const CircleImage({super.key, required this.path, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Image.network(
        path,
        height: size,
        width: size,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          path,
          height: size,
          width: size,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
