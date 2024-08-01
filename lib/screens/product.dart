import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/modules/product.dart';
import 'package:restrosupply/modules/userProvider.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';
import 'package:restrosupply/widgets/body/contacts.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';
import 'package:restrosupply/widgets/singleProduct/information.dart';
import 'package:restrosupply/widgets/singleProduct/productImage.dart';
import 'package:restrosupply/widgets/singleProduct/suggestGrid.dart';

// name, imagepath, stock, pickup, shipping, details

class SingleProduct extends StatefulWidget {
  final String productId;

  const SingleProduct({
    super.key,
    required this.productId,
  });

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      float: (context.watch<UserProvider>().position == admin ||
              context.watch<UserProvider>().position == editor)
          ? Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                  onPressed: () {
                    context.go("${RouteConstants().edit}/${widget.productId}");
                  },
                  icon: Icon(Icons.edit)))
          : null,
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection(categoryProducts)
                .doc(widget.productId)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return WaitingWidget();
              } else if (snapshot.hasError) {
                return LoadingErrorWidget();
              } else {
                Map<String, dynamic> data = snapshot.data!.data()!;
                Product product = Product.fromMap(data);

                return Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    // Row(
                    //   children: [
                    //     const Spacer(
                    //       flex: 1,
                    //     ),
                    //     LocationWidget(category: widget.category),
                    //     const Spacer(
                    //       flex: 6,
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 25,
                    // ),
                    isDevice(
                      desktop: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.12,
                          ),
                          ProductImageWidget(
                            images: product.img,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          InformationWidget(
                            product: product,
                          ),
                        ],
                      ),
                      mobile: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProductImageWidget(
                            images: product.img,
                          ),
                          const SizedBox(height: 10),
                          InformationWidget(product: product),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    isDevice(
                      desktop: Text(
                        suggestText,
                        style: MediaQuery.of(context).size.width > mobileWidth
                            ? Theme.of(context).textTheme.displayMedium
                            : Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                    isDevice(
                      desktop: SuggestGridWidget(),
                    ),
                    const ContactDetails()
                  ],
                );
              }
            }),
      ),
    );
  }
}
