import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/body/producs.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';

List<String> display = [
  "baggage",
  "kraft",
  "aluminum",
  "shopping",
  "soup",
  "coffee"
];

class HorizondalWidget extends StatelessWidget {
  const HorizondalWidget({super.key});

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
        FutureBuilder(
            future: FirebaseFirestore.instance.collection(category).get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return WaitingWidget();
              } else if (snapshot.hasError) {
                return LoadingErrorWidget();
              } else {
                List<String> ids =
                    snapshot.data!.docs.map((QueryDocumentSnapshot value) {
                  return value.id;
                }).toList();
                return MediaQuery.of(context).size.width >= mobileWidth
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          6,
                          (index) => InkWell(
                              hoverColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              onTap: () {
                                context.go(
                                    "${RouteConstants().category}/${ids[index]}");
                              },
                              child: ProductsInfo(
                                id: ids[index],
                              )),
                        ),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.width * 1.7,
                        child: GridView.builder(
                          itemCount: 6,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.9),
                          itemBuilder: (context, index) => SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: InkWell(
                                hoverColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                onTap: () {
                                  // String? category = valueToID(keys[index]);
                                  context.go(
                                      "${RouteConstants().category}/${ids[index]}");
                                },
                                child: ProductsInfo(
                                  id: ids[index],
                                )),
                          ),
                        ),
                      );
              }
            }),
        const isDevice(
          desktop: SizedBox(
            height: 10,
          ),
          mobile: SizedBox(
            height: 10,
          ),
        ),
      ],
    );
  }
}
