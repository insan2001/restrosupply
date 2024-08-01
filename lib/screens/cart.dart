import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/product.dart';
import 'package:restrosupply/modules/userProvider.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';
import 'package:restrosupply/widgets/body/customImage.dart';
import 'package:restrosupply/widgets/cart/numberInput.dart';
import 'package:restrosupply/widgets/cart/totalPrice.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';

class ShoppinCartScreen extends StatefulWidget {
  const ShoppinCartScreen({super.key});

  @override
  State<ShoppinCartScreen> createState() => _ShoppinCartScreenState();
}

class _ShoppinCartScreenState extends State<ShoppinCartScreen> {
  GlobalKey<BottomColumnWidgetState> priceKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SizedBox(
        width: 400,
        child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection(users)
                .doc(context.read<UserProvider>().uid)
                .collection(cart)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return WaitingWidget();
              } else if (snapshot.hasError) {
                return LoadingErrorWidget();
              } else {
                List<String> documents =
                    snapshot.data!.docs.map((value) => value.id).toList();

                return Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (context, index) => FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection(categoryProducts)
                                .doc(documents[index])
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return WaitingWidget();
                              } else if (snapshot.hasError) {
                                return LoadingErrorWidget();
                              } else {
                                Map<String, dynamic> data =
                                    snapshot.data!.data()!;
                                Product product = Product.fromMap(data);
                                return FutureBuilder(
                                    future: FirebaseFirestore.instance
                                        .collection(users)
                                        .doc(context.read<UserProvider>().uid)
                                        .collection(cart)
                                        .doc(documents[index])
                                        .get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return WaitingWidget();
                                      } else if (snapshot.hasError) {
                                        return LoadingErrorWidget();
                                      } else {
                                        int cartNo = snapshot.data![amount];
                                        return product.price == null
                                            ? SizedBox()
                                            : ListTile(
                                                leading: CustomImageWidget(
                                                    path: product.img[0]
                                                        [images]),
                                                title: Text(product.title),
                                                subtitle: SizedBox(
                                                  width: 450,
                                                  height: 60,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "\$ ${product.price ?? 0} * ",
                                                      ),
                                                      NumberInputField(
                                                        price:
                                                            product.price ?? 0,
                                                        initial: cartNo,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                trailing: Icon(Icons.delete),
                                              );
                                      }
                                    });
                              }
                            }),
                      ),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.1,
                    //   width: MediaQuery.of(context).size.width * 0.5,
                    //   child: BottomColumnWidget(key: priceKey, totalPrice: totalPrice)
                    // )
                  ],
                );
              }
            }),
      ),
    );
  }
}
