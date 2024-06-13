import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

List<IconData> _icon = [
  Icons.airport_shuttle,
  Icons.recycling,
  Icons.eco_outlined
];

List<String> _title = ["Robust Supply Chain", "Recyclable", "Compostable"];
List<String> _description = [
  "Quality control team at factories, sales, and fulfillment team at local warehouses.",
  "We offer recyclable plastic material such as clear and white-colored PET and PP",
  "Premium containers to serve your green customers."
];

class ThreeWidget extends StatelessWidget {
  const ThreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: 3,
        padding: EdgeInsets.only(right: 50, left: 50),
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).size.width > mobileWidth ? 3 : 1),
        itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  _icon[index],
                  size: 70,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  _title[index],
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  _description[index],
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ));
  }
}
