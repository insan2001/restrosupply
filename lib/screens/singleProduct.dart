import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/widgets/contacts.dart';

// name, imageUrl, stock, pickup, shipping, details

class SingleProduct extends StatefulWidget {
  final int index;
  final String category;
  late final List<List<dynamic>> productsData;
  SingleProduct({
    super.key,
    required this.index,
    required this.category,
    required this.productsData,
  });

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  late final List<dynamic> productData;

  @override
  void initState() {
    productData = widget.productsData[widget.index];
    widget.productsData.removeAt(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 1600,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 1300,
              child: Stack(
                children: [
                  Positioned(
                    left: MediaQuery.of(context).size.width / 10,
                    top: MediaQuery.of(context).size.height / 8,
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.labelMedium,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Home',
                              style: Theme.of(context).textTheme.labelMedium,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.maybeOf(context);
                                }),
                          TextSpan(
                            text: " > ",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          TextSpan(
                            text: widget.category,
                            style: Theme.of(context).textTheme.labelMedium,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width / 10,
                    top: MediaQuery.of(context).size.height / 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Image.network(
                            productData[1],
                            width: MediaQuery.of(context).size.width * 0.32,
                            height: 400,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.42,
                          height: 420,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productData[0],
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    productData[2] ? Icons.check : Icons.close,
                                    color: productData[2]
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    productData[2]
                                        ? "In Stock"
                                        : "Out of stock",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          color: productData[2]
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    productData[3] ? Icons.check : Icons.close,
                                    color: productData[3]
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Pickup - In store",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          color: productData[3]
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    productData[4] ? Icons.check : Icons.close,
                                    color: productData[4]
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Shinpping",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          color: productData[4]
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: List.generate(
                                    productData.length - 5,
                                    (_index) => Column(
                                          children: [
                                            Text(
                                              productData[5 + _index],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width / 3,
                    top: (MediaQuery.of(context).size.height / 5) + 450,
                    child: Text(
                      "You might also like these",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width / 10,
                    top: (MediaQuery.of(context).size.height / 5) + 500,
                    height: 620,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: List.generate(
                        widget.productsData.length <= 8
                            ? widget.productsData.length
                            : 8,
                        (_index) => Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                widget.productsData[_index][1],
                                fit: BoxFit.fitWidth,
                                height: 200,
                              ),
                              Text(
                                widget.productsData[_index][0],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ContactDetails()
          ],
        ),
      ),
    );
  }
}
