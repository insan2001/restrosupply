import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/functions/uploadImg.dart';
import 'package:restrosupply/modules/product.dart';
import 'package:restrosupply/widgets/edit/image.dart';

class AllImages extends StatefulWidget {
  final Product product;
  final String id;
  final Map<String, dynamic> productData;
  const AllImages(
      {super.key,
      required this.product,
      required this.id,
      required this.productData});

  @override
  State<AllImages> createState() => _AllImagesState();
}

class _AllImagesState extends State<AllImages> {
  List<Map<String, String>> imageList = [];

  @override
  void initState() {
    imageList = widget.product.img;
    super.initState();
  }

  setImages(List<Map<String, String>>? images) {
    if (images == null) return;
    setState(() {
      imageList = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ...List.generate(
        imageList.length >= 4 ? 4 : imageList.length,
        (index) => EditImageWidget(
          key: UniqueKey(),
          currentImg: imageList[index][images],
          product: widget.product,
          index: index,
          id: widget.id,
          catLocation: widget.productData[location][0],
          seter: setImages,
        ),
      ),
      imageList.length != 4
          ? IconButton(
              onPressed: () async {
                setImages((await addImage(
                    widget.id,
                    widget.productData[location][0],
                    imageList,
                    imageList.length + 1)));
              },
              icon: Icon(Icons.add))
          : SizedBox(),
    ]);
  }
}
