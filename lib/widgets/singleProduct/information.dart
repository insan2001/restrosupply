import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class InformationWidget extends StatelessWidget {
  final List<dynamic> productData;
  const InformationWidget({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width > mobileWidth
              ? MediaQuery.of(context).size.width * 0.5
              : MediaQuery.of(context).size.width * 0.8,
          child: Text(
            productData[textIndex],
            maxLines: 2,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Row(
          children: [
            Icon(
              productData[stockIndex] ? Icons.check : Icons.close,
              color: productData[stockIndex] ? Colors.green : Colors.red,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              productData[stockIndex] ? "In Stock" : "Out of stock",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: productData[stockIndex] ? Colors.green : Colors.red,
                  ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              productData[pickupIndex] ? Icons.check : Icons.close,
              color: productData[pickupIndex] ? Colors.green : Colors.red,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Pickup - In store",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: productData[pickupIndex] ? Colors.green : Colors.red,
                  ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              productData[shippingIndex] ? Icons.check : Icons.close,
              color: productData[shippingIndex] ? Colors.green : Colors.red,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Shinpping",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color:
                        productData[shippingIndex] ? Colors.green : Colors.red,
                  ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              productData.length - detailsIndex,
              (_index) => Column(
                    children: [
                      Text(
                        productData[detailsIndex + _index],
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  )),
        ),
      ],
    );
  }
}
