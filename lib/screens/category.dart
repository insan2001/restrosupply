import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/body/contacts.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';
import 'package:restrosupply/widgets/body/customImage.dart';
import 'package:restrosupply/widgets/category/dropDown.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';

class AllProducts extends StatefulWidget {
  final String category;

  const AllProducts({super.key, required this.category});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: widget.category == all
                ? FirebaseFirestore.instance.collection(categoryProducts).get()
                : FirebaseFirestore.instance
                    .collection(category)
                    .doc(widget.category)
                    .collection(widget.category)
                    .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return WaitingWidget();
              } else if (snapshot.hasError) {
                return LoadingErrorWidget();
              } else {
                List<String> productIds =
                    snapshot.data!.docs.map((QueryDocumentSnapshot value) {
                  return value.id;
                }).toList();

                return Column(
                  children: [
                    Center(
                      child: FutureBuilder(
                          future: widget.category == all
                              ? null
                              : FirebaseFirestore.instance
                                  .collection(category)
                                  .doc(widget.category)
                                  .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return WaitingWidget();
                            } else if (snapshot.hasError) {
                              return LoadingErrorWidget();
                            } else {
                              return Text(
                                snapshot.data == null
                                    ? all
                                    : snapshot.data!.data()![categoryName],
                                style: Theme.of(context).textTheme.displayLarge,
                              );
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "${productIds.length} item(s) found",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    CustomDropDownWidget(id: widget.category),
                    isDevice(
                      desktop: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.07,
                            right: MediaQuery.of(context).size.width * 0.07,
                            top: 20),
                        itemCount: productIds.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => FutureBuilder(
                            future: widget.category != all
                                ? FirebaseFirestore.instance
                                    .collection(category)
                                    .doc(widget.category)
                                    .collection(widget.category)
                                    .doc(productIds[index])
                                    .get()
                                : FirebaseFirestore.instance
                                    .collection(categoryProducts)
                                    .doc(productIds[index])
                                    .get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return WaitingWidget();
                              } else if (snapshot.hasError) {
                                return LoadingErrorWidget();
                              } else {
                                Map<String, dynamic> productData =
                                    snapshot.data!.data()!;
                                String _productImg = widget.category != all
                                    ? productData[images]
                                    : productData[images].length == 0
                                        ? ""
                                        : productData[images][0][images];
                                return GestureDetector(
                                  onTap: () {
                                    context.go(
                                        "${RouteConstants().product}/${productIds[index]}");
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.2 *
                                        0.8,
                                    height:
                                        MediaQuery.of(context).size.width * 0.2,
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.007,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.007,
                                        top: MediaQuery.of(context).size.width *
                                            0.007),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Stack(
                                            children: [
                                              CustomImageWidget(
                                                path: _productImg,
                                                height: MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        mobileWidth
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.2
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.8,
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        mobileWidth
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.2
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.8,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          productData[titlee],
                                          maxLines: 2,
                                          overflow: TextOverflow.fade,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            }),
                      ),
                      mobile: ListView.separated(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: productIds.length,
                        separatorBuilder: (context, index) => Container(
                          height: 0.5,
                          color: Theme.of(context).primaryColor,
                        ),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => FutureBuilder(
                            future: widget.category != all
                                ? FirebaseFirestore.instance
                                    .collection(category)
                                    .doc(widget.category)
                                    .collection(widget.category)
                                    .doc(productIds[index])
                                    .get()
                                : FirebaseFirestore.instance
                                    .collection(categoryProducts)
                                    .doc(productIds[index])
                                    .get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return WaitingWidget();
                              } else if (snapshot.hasError) {
                                return LoadingErrorWidget();
                              } else {
                                Map<String, dynamic> productData =
                                    snapshot.data!.data()!;

                                String productImg = widget.category != all
                                    ? productData[images]
                                    : productData[images].length == 0
                                        ? ""
                                        : productData[images][0][images];
                                return ListTile(
                                  onTap: () {
                                    context.go(
                                        "${RouteConstants().product}/${productIds[index]}");
                                  },
                                  leading: CustomImageWidget(
                                    path: productImg,
                                    width: MediaQuery.of(context).size.height *
                                        0.1,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),
                                  title: Text(
                                    productData[titlee],
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                );
                              }
                            }),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const ContactDetails(),
                  ],
                );
              }
            }),
      ),
    );
  }
}
