import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class SuggestWidget extends StatelessWidget {
  final int index;
  final List<List<dynamic>> productsData;
  const SuggestWidget(
      {super.key, required this.index, required this.productsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Image.network(
              productsData[index][imageIndex],
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.width > mobileWidth
                  ? MediaQuery.of(context).size.width / 10
                  : MediaQuery.of(context).size.width * 0.8,
              width: MediaQuery.of(context).size.width > mobileWidth
                  ? MediaQuery.of(context).size.width / 10
                  : MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: Text(
              productsData[index][textIndex],
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
