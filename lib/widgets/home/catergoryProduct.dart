import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/screens/allProduct.dart';
import 'package:restrosupply/widgets/body/customImage.dart';
import 'package:restrosupply/widgets/home/changeProduct.dart';

class CatergoryproductWidget extends StatefulWidget {
  final List<String> keys;
  const CatergoryproductWidget({super.key, required this.keys});

  @override
  State<CatergoryproductWidget> createState() => _CatergoryproductWidgetState();
}

class _CatergoryproductWidgetState extends State<CatergoryproductWidget> {
  @override
  Widget build(BuildContext context) {
    return isDevice(
      desktop: Container(
        height: ((mobileWidth * 0.5) + 20) * 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            5,
            (index) => Container(
              color: Colors.white,
              height: mobileWidth * 0.5,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [
                  SizedBox(
                    width: mobileWidth * 0.5,
                    child: Column(
                      children: [
                        Text(
                          widget.keys[index],
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Stack(
                          children: [
                            Center(
                              child: CustomImageWidget(
                                path:
                                    dataList[widget.keys[index]]![catImage]![0]
                                        [0],
                                width: 250,
                                height: 250,
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  splashColor: null,
                                  highlightColor: null,
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AllProducts(
                                              category: dataList.keys
                                                  .toList()[index]))),
                                  child: Container(
                                    width: 120,
                                    height: 50,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text(
                                        "View More",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.8) -
                        (mobileWidth * 0.5),
                    child: ProductSideviewWidget(
                      index: index,
                      keys: widget.keys,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
