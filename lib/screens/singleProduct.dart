import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';
import 'package:restrosupply/widgets/body/contacts.dart';
import 'package:restrosupply/widgets/listViewProducts.dart';
import 'package:restrosupply/widgets/singleProduct/information.dart';
import 'package:restrosupply/widgets/singleProduct/location.dart';
import 'package:restrosupply/widgets/singleProduct/productImage.dart';
import 'package:restrosupply/widgets/singleProduct/suggestGrid.dart';

// name, imagepath, stock, pickup, shipping, details

class SingleProduct extends StatefulWidget {
  final int index;
  final String category;

  const SingleProduct({
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
    print(productData);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Spacer(
                  flex: 1,
                ),
                LocationWidget(category: widget.category),
                const Spacer(
                  flex: 6,
                ),
              ],
            ),
            const SizedBox(
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
                  ProductImageWidget(
                    path: productData[imageIndex],
                    url:
                        '$myWebsiteURL${RouteConstants().product.substring(1)}/${valueToID(widget.category)}-${widget.index}',
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  InformationWidget(
                      index: widget.index, category: widget.category),
                ],
              ),
              mobile: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProductImageWidget(
                    path: productData[imageIndex],
                    url:
                        '$myWebsiteURL${RouteConstants().product.substring(1)}/${valueToID(widget.category)}-${widget.index}',
                  ),
                  const SizedBox(height: 10),
                  InformationWidget(
                      index: widget.index, category: widget.category),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              suggestText,
              style: MediaQuery.of(context).size.width > mobileWidth
                  ? Theme.of(context).textTheme.displayMedium
                  : Theme.of(context).textTheme.displaySmall,
            ),
            isDevice(
              desktop: SuggestGridWidget(
                category: widget.category,
              ),
              mobile: MyCustomListView(
                selectedData:
                    dataList[widget.category]![data]!.take(8).toList(),
                category: widget.category,
              ),
            ),
            const ContactDetails()
          ],
        ),
      ),
    );
  }
}
