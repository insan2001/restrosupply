import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/functions/removeImage.dart';
import 'package:restrosupply/functions/uploadImg.dart';
import 'package:restrosupply/modules/product.dart';
import 'package:restrosupply/widgets/body/customImage.dart';

class EditImageWidget extends StatefulWidget {
  final String? currentImg;
  final Product product;
  final int index;
  final String id;
  final String catLocation;
  final Function seter;
  const EditImageWidget(
      {super.key,
      required this.product,
      required this.id,
      required this.catLocation,
      required this.index,
      required this.seter,
      required this.currentImg});

  @override
  State<EditImageWidget> createState() => _EditImageWidgetState();
}

class _EditImageWidgetState extends State<EditImageWidget> {
  late String? currentImg;

  @override
  void initState() {
    currentImg = widget.currentImg;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImageWidget(
          path: currentImg,
          width: MediaQuery.of(context).size.width > mobileWidth
              ? 250
              : MediaQuery.of(context).size.width / 5,
          height: MediaQuery.of(context).size.width > mobileWidth
              ? 250
              : MediaQuery.of(context).size.width / 5,
        ),
        Positioned(
            top: 0,
            left: 0,
            child: IconButton(
                onPressed: () async {
                  widget.seter((await removeImage(
                      widget.product.img[widget.index][imageStore] ?? "",
                      widget.id,
                      widget.catLocation,
                      widget.product.img,
                      widget.index)));
                },
                icon: Icon(Icons.delete))),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
              onPressed: () async {
                // await removeImage(
                //     product.imgStore[0] ?? "", widget.id);
                String? url = (await addImage(widget.id, widget.catLocation,
                    widget.product.img, widget.index))[widget.index][images];
                setState(() {
                  currentImg = url;
                });
                // FirebaseFirestore.instance
                //     .collection(categoryProducts)
                //     .doc(widget.id)
                //     .update({images: []});
              },
              icon: Icon(
                Icons.edit,
                size: 30,
                color: Theme.of(context).primaryColor,
              )),
        )
      ],
    );
  }
}
