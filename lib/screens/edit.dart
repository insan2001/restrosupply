import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/editor/editor.dart';
import 'package:restrosupply/modules/product.dart';
import 'package:restrosupply/modules/userProvider.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';
import 'package:restrosupply/widgets/edit/allImages.dart';
import 'package:restrosupply/widgets/edit/deliverySwitch.dart';
import 'package:restrosupply/widgets/edit/pickupSwitch.dart';

class ProductEditorScreen extends StatefulWidget {
  final String id;
  const ProductEditorScreen({super.key, required this.id});

  @override
  State<ProductEditorScreen> createState() => _ProductEditorScreenState();
}

class _ProductEditorScreenState extends State<ProductEditorScreen> {
  TextEditingController titleEditor = TextEditingController();
  TextEditingController mfgEditor = TextEditingController();
  TextEditingController descriptionEditor = TextEditingController();
  TextEditingController priceEditor = TextEditingController();
  TextEditingController qtyEditor = TextEditingController();
  TextEditingController pieceEditor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (context.watch<UserProvider>().position == admin ||
        context.watch<UserProvider>().position == editor) {
      return FutureBuilder(
          future: FirebaseFirestore.instance
              .collection(categoryProducts)
              .doc(widget.id)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return WaitingWidget();
            } else if (snapshot.hasError) {
              return LoadingErrorWidget();
            } else {
              Map<String, dynamic> productData =
                  snapshot.data!.data() as Map<String, dynamic>;
              // List<String> _location = [];
              // for (String loc in productData[location]) {
              //   _location.add(loc);
              // }
              Product product = Product.fromMap(productData);
              return CustomScaffold(
                body: SingleChildScrollView(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AllImages(
                          product: product,
                          id: widget.id,
                          productData: productData,
                        ),
                        SizedBox(height: 10),
                        DetailEditor(
                          title: titlee,
                          content: product.title,
                          controller: titleEditor,
                          path: widget.id,
                        ),
                        DetailEditor(
                          title: prices,
                          price: product.price,
                          controller: priceEditor,
                          path: widget.id,
                          content: null,
                        ),
                        DetailEditor(
                          title: detailss,
                          content: product.details?.join(","),
                          controller: descriptionEditor,
                          path: widget.id,
                        ),
                        DetailEditor(
                          title: qty,
                          content: product.quantity.toString(),
                          controller: qtyEditor,
                          path: widget.id,
                        ),
                        DetailEditor(
                          title: pieces,
                          content: product.piece.toString(),
                          controller: pieceEditor,
                          path: widget.id,
                        ),
                        PickupSwitch(state: product.pickup, id: widget.id),
                        DeliverySwitch(state: product.shipping, id: widget.id),
                      ],
                    ),
                  ),
                ),
              );
            }
          });
    } else {
      return Material(
          child: Center(
              child: Text("You are not authorized to perform this action")));
    }
  }
}
