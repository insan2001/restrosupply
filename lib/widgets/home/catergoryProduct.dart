import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/body/customImage.dart';
import 'package:restrosupply/widgets/home/changeProduct.dart';

class CatergoryproductWidget extends StatefulWidget {
  final List<String> keys;
  const CatergoryproductWidget({super.key, required this.keys});

  @override
  State<CatergoryproductWidget> createState() => _CatergoryproductWidgetState();
}

class _CatergoryproductWidgetState extends State<CatergoryproductWidget> {
  @override
  Widget build(BuildContext context) {
    return isDevice(
      desktop: SizedBox(
        height: ((MediaQuery.of(context).size.width * 0.25) + 20) * 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            5,
            (index) => Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.width * 0.25,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Column(
                      children: [
                        Text(
                          widget.keys[index],
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.02),
                        ),
                        Stack(
                          children: [
                            Center(
                              child: CustomImageWidget(
                                path:
                                    dataList[widget.keys[index]]![catImage]![0]
                                        [0],
                                width: MediaQuery.of(context).size.width * 0.2,
                                height: MediaQuery.of(context).size.width * 0.2,
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  splashColor: null,
                                  highlightColor: null,
                                  onTap: () {
                                    String? category = valueToID(
                                        dataList.keys.toList()[index]);
                                    context.go(
                                        "${RouteConstants().category}/$category");
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.08,
                                    height: MediaQuery.of(context).size.width *
                                        0.04,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text(
                                        "View More",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.01),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.8) -
                        (MediaQuery.of(context).size.width * 0.25),
                    child: ProductSideviewWidget(
                      index: index,
                      keys: widget.keys,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
