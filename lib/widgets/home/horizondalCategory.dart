import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/routeConstants.dart';
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
        const SizedBox(
          height: 10,
        ),
        Text(
          "Shop By Category",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const isDevice(
          desktop: SizedBox(
            height: 10,
          ),
          mobile: SizedBox(
            height: 40,
          ),
        ),
        MediaQuery.of(context).size.width >= mobileWidth
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  display.length,
                  (index) => InkWell(
                      hoverColor: Theme.of(context).scaffoldBackgroundColor,
                      onTap: () {
                        String? category = valueToID(keys[index]);
                        context.go("${RouteConstants().category}/$category");
                      },
                      child: ProductsInfo(keys: keys, index: index)),
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.width * 1.6,
                child: GridView.builder(
                  itemCount: 6,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.9),
                  itemBuilder: (context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: InkWell(
                        hoverColor: Theme.of(context).scaffoldBackgroundColor,
                        onTap: () {
                          String? category = valueToID(keys[index]);
                          context.go("${RouteConstants().category}/$category");
                        },
                        child: ProductsInfo(keys: keys, index: index)),
                  ),
                ),
              ),
      ],
    );
  }
}
