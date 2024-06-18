import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/screens/allProduct.dart';
import 'package:restrosupply/widgets/body/producs.dart';

List<String> display = [
  "baggage",
  "kraft",
  "aluminum",
  "shopping",
  "soup",
  "coffee"
];

class HorizondalWidget extends StatelessWidget {
  final List<String> keys;
  const HorizondalWidget({super.key, required this.keys});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          "Shop By Category",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          height: 10,
        ),
        MediaQuery.of(context).size.width >= mobileWidth
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  display.length,
                  (index) => InkWell(
                      splashColor: null,
                      highlightColor: null,
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllProducts(
                                category: keys[index],
                              ),
                            ),
                          ),
                      child: ProductsInfo(keys: keys, index: index)),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  6,
                  (index) => InkWell(
                      splashColor: null,
                      highlightColor: null,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AllProducts(category: keys[index]))),
                      child: ProductsInfo(keys: keys, index: index)),
                ),
              ),
      ],
    );
  }
}
