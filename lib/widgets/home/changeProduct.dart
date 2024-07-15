import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/productData.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/body/customImage.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';

class ProductSideviewWidget extends StatefulWidget {
  final List<String> ids;
  const ProductSideviewWidget({super.key, required this.ids});

  @override
  State<ProductSideviewWidget> createState() => _ProductSideviewWidgetState();
}

class _ProductSideviewWidgetState extends State<ProductSideviewWidget> {
  int _productIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      IconButton(
        onPressed: () {
          if (_productIndex != 0) {
            setState(() {
              _productIndex -= 1;
            });
          }
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: _productIndex == 0 ? Colors.grey : Colors.red,
          size: MediaQuery.of(context).size.width * 0.05,
        ),
      ),
      ...List.generate(
        3,
        (index) => InkWell(
          splashColor: null,
          highlightColor: null,
          onTap: () {
            // String? category = valueToID(widget.keys[widget.index]);
            context.go(
                "${RouteConstants().product}/${widget.ids[index + _productIndex]}");
          },
          child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection(categoryProducts)
                  .doc(widget.ids[index + _productIndex])
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return WaitingWidget();
                } else if (snapshot.hasError) {
                  return LoadingErrorWidget();
                } else {
                  Map<String, dynamic> productData = snapshot.data!.data()!;
                  return Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, top: 15, bottom: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        width: MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.width / 4.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomImageWidget(
                              path: productData[images][0],
                              height: MediaQuery.of(context).size.width / 9,
                              width: MediaQuery.of(context).size.width / 9,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              productData[titlee],
                              style: Theme.of(context).textTheme.labelMedium,
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
              }),
        ),
      ),
      IconButton(
        onPressed: () {
          if (_productIndex + 3 < widget.ids.length) {
            setState(() {
              _productIndex += 1;
            });
          }
        },
        icon: Icon(
          Icons.arrow_forward_ios,
          color:
              _productIndex + 3 == widget.ids.length ? Colors.grey : Colors.red,
          size: MediaQuery.of(context).size.width * 0.05,
        ),
      ),
    ]);
  }
}
