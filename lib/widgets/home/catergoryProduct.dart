import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/screens/allProduct.dart';
import 'package:restrosupply/screens/singleProduct.dart';

class CatergoryproductWidget extends StatelessWidget {
  final List<String> keys;
  const CatergoryproductWidget({super.key, required this.keys});

  @override
  Widget build(BuildContext context) {
    return isDevice(
      desktop: Container(
        height: ((mobileWidth * 0.5) + 20) * 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            5,
            (index) => SizedBox(
              height: mobileWidth * 0.5,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [
                  SizedBox(
                    width: mobileWidth * 0.5,
                    child: Column(
                      children: [
                        Text(
                          keys[index],
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                dataList[keys[index]]![catImage]![0][0],
                                fit: BoxFit.cover,
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          dataList[keys[index]]![data]!.length,
                          (_index) => InkWell(
                            splashColor: null,
                            highlightColor: null,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SingleProduct(
                                  index: _index,
                                  category: keys[index],
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  width: MediaQuery.of(context).size.width / 8,
                                  height: MediaQuery.of(context).size.width / 5,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Image.asset(
                                          dataList[keys[index]]![data]![_index]
                                              [imageIndex],
                                          fit: BoxFit.fitWidth,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              8,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              8,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        dataList[keys[index]]![data]![_index]
                                            [textIndex],
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                        maxLines: 2,
                                        overflow: TextOverflow.fade,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
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
