import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/widgets/body/customImage.dart';

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
      child: CustomImageWidget(
        path: path,
        width: MediaQuery.of(context).size.width > mobileWidth
            ? MediaQuery.of(context).size.width * 0.25
            : MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.width > mobileWidth
            ? MediaQuery.of(context).size.width * 0.25
            : MediaQuery.of(context).size.width * 0.6,
      ),
    );
  }
}
