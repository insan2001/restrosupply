import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class ProductImageWidget extends StatelessWidget {
  final String path;
  const ProductImageWidget({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Image.asset(
        path,
        width: MediaQuery.of(context).size.width > mobileWidth
            ? MediaQuery.of(context).size.width * 0.27
            : MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width > mobileWidth
            ? MediaQuery.of(context).size.width * 0.27
            : MediaQuery.of(context).size.width * 0.8,
        fit: BoxFit.cover,
      ),
    );
  }
}
