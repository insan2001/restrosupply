import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/widgets/contacts.dart';

// name, imageUrl, stock, pickup, shipping, details

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
  late final List<List<dynamic>> productsData;

  @override
  void initState() {
    productsData = dataList[widget.category]![data]!;
    productData = productsData[widget.index];
    productsData.removeAt(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.labelMedium,
              children: <TextSpan>[
                TextSpan(
                    text: 'Home',
                    style: Theme.of(context).textTheme.labelLarge,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.maybeOf(context);
                      }),
                TextSpan(
                  text: " > ",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                TextSpan(
                  text: widget.category,
                  style: Theme.of(context).textTheme.labelLarge,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pop(context);
                    },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 2,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Image.network(
                  productData[imageIndex],
                  width: MediaQuery.of(context).size.width * 0.32,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productData[textIndex],
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Row(
                      children: [
                        Icon(
                          productData[stockIndex] ? Icons.check : Icons.close,
                          color: productData[stockIndex]
                              ? Colors.green
                              : Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          productData[stockIndex] ? "In Stock" : "Out of stock",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: productData[stockIndex]
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          productData[pickupIndex] ? Icons.check : Icons.close,
                          color: productData[pickupIndex]
                              ? Colors.green
                              : Colors.red,
                        ),
                        Text(
                          "Pickup - In store",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: productData[pickupIndex]
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          productData[shippingIndex]
                              ? Icons.check
                              : Icons.close,
                          color: productData[shippingIndex]
                              ? Colors.green
                              : Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Shinpping",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: productData[shippingIndex]
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(
                          productData.length - detailsIndex,
                          (_index) => Column(
                                children: [
                                  Text(
                                    productData[detailsIndex + _index],
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              )),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 5,
              ),
            ],
          ),
          Text(
            "You might also like these",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8),
            shrinkWrap: true,
            itemCount: productsData.length <= 8 ? productsData.length : 8,
            itemBuilder: (context, _index) => Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    productsData[_index][imageIndex],
                    fit: BoxFit.cover,
                    height: (MediaQuery.of(context).size.width / 4) - 20,
                    width: (MediaQuery.of(context).size.width / 4) - 20,
                  ),
                  Text(
                    productsData[_index][textIndex],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ),
          ContactDetails()
        ],
      ),
    );
  }
}
