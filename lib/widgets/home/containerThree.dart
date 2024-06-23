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
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).size.width > mobileWidth ? 3 : 1,
            childAspectRatio:
                MediaQuery.of(context).size.width > mobileWidth ? 2.2 : 3),
        itemBuilder: (context, index) => Column(
              mainAxisAlignment: MediaQuery.of(context).size.width > mobileWidth
                  ? MainAxisAlignment.spaceAround
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  _icon[index],
                  size: MediaQuery.of(context).size.width > mobileWidth
                      ? MediaQuery.of(context).size.width * 0.05
                      : 50,
                  color: Theme.of(context).primaryColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _title[index],
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width > mobileWidth
                          ? MediaQuery.of(context).size.width * 0.25
                          : MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        _description[index],
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    )
                  ],
                )
              ],
            ));
  }
}
