import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/functions/uploadImage.dart';
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
    return SizedBox(
      width: MediaQuery.of(context).size.width > mobileWidth
          ? MediaQuery.of(context).size.width * 0.25
          : MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.width > mobileWidth
          ? MediaQuery.of(context).size.width * 0.25
          : MediaQuery.of(context).size.width * 0.6,
      child: Stack(
        children: [
          FlipCard(
            back: Container(
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
            front: QrImageView(
              data: widget.url,
              size: MediaQuery.of(context).size.width > mobileWidth
                  ? MediaQuery.of(context).size.width * 0.25
                  : MediaQuery.of(context).size.width * 0.6,
              version: QrVersions.auto,
              backgroundColor: Colors.blueAccent,
            ),
            autoFlipDuration: const Duration(seconds: 1),
            flipOnTouch: true,
          ),
          isAdmin
              ? Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: Center(
                      child: IconButton(
                          onPressed: () async {
                            String fileName = widget.url.split("/").last;
                            List<String> productID = fileName.split("-");
                            await uploadFile(fileName).then((String value) {
                              setState(() {
                                dataList[categoryId[productID[0]]]![data]![
                                        int.parse(productID[1])][imageIndex] =
                                    value;
                                widget.path;
                              });
                              // writeData(context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(value)));
                            });
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          )),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
