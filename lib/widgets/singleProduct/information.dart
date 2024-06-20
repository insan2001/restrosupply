import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class InformationWidget extends StatefulWidget {
  final List<dynamic> productData;
  const InformationWidget({super.key, required this.productData});

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
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
            widget.productData[textIndex],
            maxLines: 2,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(
                width:
                    MediaQuery.of(context).size.width <= mobileWidth ? 20 : 0),
            Icon(
              widget.productData[stockIndex] ? Icons.check : Icons.close,
              color: widget.productData[stockIndex] ? Colors.green : Colors.red,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.productData[stockIndex] ? "In Stock" : "Out of stock",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: widget.productData[stockIndex]
                        ? Colors.green
                        : Colors.red,
                  ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
                width:
                    MediaQuery.of(context).size.width <= mobileWidth ? 20 : 0),
            Icon(
              widget.productData[pickupIndex] ? Icons.check : Icons.close,
              color:
                  widget.productData[pickupIndex] ? Colors.green : Colors.red,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Pickup - In store",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: widget.productData[pickupIndex]
                        ? Colors.green
                        : Colors.red,
                  ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
                width:
                    MediaQuery.of(context).size.width <= mobileWidth ? 20 : 0),
            Icon(
              widget.productData[shippingIndex] ? Icons.check : Icons.close,
              color:
                  widget.productData[shippingIndex] ? Colors.green : Colors.red,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Shinpping",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: widget.productData[shippingIndex]
                        ? Colors.green
                        : Colors.red,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              widget.productData.length - detailsIndex,
              (index) => Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width <=
                                      mobileWidth
                                  ? 20
                                  : 0),
                          Text(
                            widget.productData[detailsIndex + index],
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ],
                  )),
        ),
      ],
    );
  }
}
