import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/widgets/body/customImage.dart';

class ProductImageWidget extends StatefulWidget {
  final String path;
  final String url;
  const ProductImageWidget({super.key, required this.path, required this.url});

  @override
  State<ProductImageWidget> createState() => _ProductImageWidgetState();
}

class _ProductImageWidgetState extends State<ProductImageWidget> {
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: CustomImageWidget(
          path: widget.path,
          width: MediaQuery.of(context).size.width > mobileWidth
              ? MediaQuery.of(context).size.width * 0.25
              : MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.width > mobileWidth
              ? MediaQuery.of(context).size.width * 0.25
              : MediaQuery.of(context).size.width * 0.6,
        ),
      ),
      back: QrImageView(
        data: widget.url,
        size: MediaQuery.of(context).size.width > mobileWidth
            ? MediaQuery.of(context).size.width * 0.25
            : MediaQuery.of(context).size.width * 0.6,
        version: QrVersions.auto,
        backgroundColor: Colors.blueAccent,
      ),
      autoFlipDuration: const Duration(seconds: 2),
      flipOnTouch: true,
    );
  }
}
