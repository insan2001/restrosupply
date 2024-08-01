import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/body/customImage.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';
import 'package:restrosupply/widgets/home/changeProduct.dart';

class CatergoryproductWidget extends StatefulWidget {
  const CatergoryproductWidget({super.key});

  @override
  State<CatergoryproductWidget> createState() => _CatergoryproductWidgetState();
}

class _CatergoryproductWidgetState extends State<CatergoryproductWidget> {
  @override
  Widget build(BuildContext context) {
    return isDevice(
      desktop: SizedBox(
        height: ((MediaQuery.of(context).size.width * 0.25) + 20) * 5,
        child: FutureBuilder(
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    5,
                    (index) => FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection(category)
                            .doc(ids[index])
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return WaitingWidget();
                          } else if (snapshot.hasError) {
                            return LoadingErrorWidget();
                          } else {
                            Map<String, dynamic> data = snapshot.data!.data()!;
                            return Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.width * 0.25,
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    child: Column(
                                      children: [
                                        Text(
                                          data[categoryName],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02),
                                        ),
                                        Stack(
                                          children: [
                                            Center(
                                              child: CustomImageWidget(
                                                path: data[categoryImage],
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                              ),
                                            ),
                                            Positioned.fill(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: InkWell(
                                                  splashColor: null,
                                                  highlightColor: null,
                                                  onTap: () {
                                                    context.go(
                                                        "${RouteConstants().category}/${ids[index]}");
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.06,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Center(
                                                      child: Text(
                                                        "View More",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium!
                                                            .copyWith(
                                                                fontSize: MediaQuery.of(
                                                                            context)
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
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: (MediaQuery.of(context).size.width *
                                            0.8) -
                                        (MediaQuery.of(context).size.width *
                                            0.25),
                                    child: FutureBuilder(
                                        future: FirebaseFirestore.instance
                                            .collection(category)
                                            .doc(ids[index])
                                            .collection(ids[index])
                                            .get(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return WaitingWidget();
                                          } else if (snapshot.hasError) {
                                            return LoadingErrorWidget();
                                          } else {
                                            List<String> ids = snapshot
                                                .data!.docs
                                                .map((QueryDocumentSnapshot
                                                    value) {
                                              return value.id;
                                            }).toList();
                                            return ProductSideviewWidget(
                                              ids: ids,
                                            );
                                          }
                                        }),
                                  )
                                ],
                              ),
                            );
                          }
                        }),
                  ),
                );
              }
            }),
      ),
    );
  }
}
