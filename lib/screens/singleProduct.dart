import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';
import 'package:restrosupply/widgets/body/contacts.dart';
import 'package:restrosupply/widgets/singleProduct/information.dart';
import 'package:restrosupply/widgets/singleProduct/location.dart';
import 'package:restrosupply/widgets/singleProduct/productImage.dart';
import 'package:restrosupply/widgets/singleProduct/suggestGrid.dart';
import 'package:restrosupply/widgets/singleProduct/suggestText.dart';

// name, imagepath, stock, pickup, shipping, details

class SingleProduct extends StatefulWidget {
  final int index;
  final String category;

  SingleProduct({
    super.key,
    required this.index,
    required this.category,
  });

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  late final List<dynamic> productData;
  late final String category;
  late final List<List<dynamic>> productsData;

  @override
  void initState() {
    productsData = dataList[widget.category]![data]!;
    productData = productsData[widget.index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                LocationWidget(category: widget.category),
                Spacer(
                  flex: 6,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            isDevice(
              desktop: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                  ProductImageWidget(path: productData[imageIndex]),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  InformationWidget(productData: productData),
                ],
              ),
              mobile: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProductImageWidget(path: productData[imageIndex]),
                  SizedBox(height: 10),
                  InformationWidget(productData: productData),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SuggestTextWidget(),
            SuggestGridWidget(
              category: widget.category,
            ),
            ContactDetails()
          ],
        ),
      ),
    );
  }
}
