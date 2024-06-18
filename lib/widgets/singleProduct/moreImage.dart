import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/widgets/body/customImage.dart';

class SuggestWidget extends StatelessWidget {
  final int index;
  final List<List<dynamic>> productsData;
  const SuggestWidget(
      {super.key, required this.index, required this.productsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2 * 0.8,
      height: MediaQuery.of(context).size.width * 0.2,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomImageWidget(
              path: productsData[index][imageIndex],
              height: MediaQuery.of(context).size.width > mobileWidth
                  ? MediaQuery.of(context).size.width * 0.2
                  : MediaQuery.of(context).size.width * 0.8,
              width: MediaQuery.of(context).size.width > mobileWidth
                  ? MediaQuery.of(context).size.width * 0.2
                  : MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Spacer(),
          Text(
            productsData[index][textIndex],
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
