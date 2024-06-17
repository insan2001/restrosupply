import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/widgets/body/customImage.dart';

class ProductsInfo extends StatelessWidget {
  final List<String> keys;
  final int index;
  const ProductsInfo({super.key, required this.keys, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > mobileWidth
          ? MediaQuery.of(context).size.width / 8
          : MediaQuery.of(context).size.width,
      padding: MediaQuery.of(context).size.width > mobileWidth
          ? EdgeInsets.all(0)
          : EdgeInsets.all(22),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: CustomImageWidget(
              path: dataList[keys[index]]![catImage]![0][0],
              width: MediaQuery.of(context).size.width >= mobileWidth
                  ? MediaQuery.of(context).size.width / 7.5
                  : MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width >= mobileWidth
                  ? MediaQuery.of(context).size.width / 7.5
                  : MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 45,
            child: Text(
              keys[index],
              style: MediaQuery.of(context).size.width >= mobileWidth
                  ? Theme.of(context).textTheme.labelMedium
                  : Theme.of(context).textTheme.displaySmall,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
