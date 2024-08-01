import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/widgets/body/customImage.dart';
import 'dart:html' as html;

class ProductImageWidget extends StatefulWidget {
  final List<Map<String, String>> images;
  const ProductImageWidget({super.key, required this.images});

  @override
  State<ProductImageWidget> createState() => _ProductImageWidgetState();
}

class _ProductImageWidgetState extends State<ProductImageWidget> {
  String? currentImage = "";

  @override
  void initState() {
    currentImage = widget.images[0][images];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width > mobileWidth
          ? MediaQuery.of(context).size.width * 0.25
          : MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.width > mobileWidth
          ? MediaQuery.of(context).size.width * 0.25
          : MediaQuery.of(context).size.width * 0.6,
      child: FlipCard(
        back: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: CustomImageWidget(
                path: currentImage,
                width: MediaQuery.of(context).size.width > mobileWidth
                    ? MediaQuery.of(context).size.width * 0.25
                    : MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width > mobileWidth
                    ? MediaQuery.of(context).size.width * 0.25
                    : MediaQuery.of(context).size.width * 0.6,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Row(
                children: List.generate(
                  widget.images.length,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        currentImage = widget.images[index][images];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: CustomImageWidget(
                        path: widget.images[index][images],
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        front: QrImageView(
          data: html.window.location.href,
          size: MediaQuery.of(context).size.width > mobileWidth
              ? MediaQuery.of(context).size.width * 0.25
              : MediaQuery.of(context).size.width * 0.6,
          version: QrVersions.auto,
          backgroundColor: Colors.blueAccent,
        ),
        autoFlipDuration: const Duration(seconds: 1),
        flipOnTouch: true,
      ),
    );
  }
}
