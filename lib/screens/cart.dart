import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/cartProvider.dart';
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
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection(users)
                .doc(context.read<UserProvider>().uid)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const WaitingWidget();
              } else if (snapshot.hasError) {
                return const LoadingErrorWidget();
              } else {
                Map<String, dynamic> currentCart = snapshot.data!.data()![cart];
                List<String> productIds = currentCart.keys.toList();
                if (productIds.isEmpty) {
                  return const Center(child: Text("Your cart is empty"));
                } else {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width >= mobileWidth
                        ? mobileWidth
                        : MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Scrollbar(
                              thumbVisibility: true,
                              trackVisibility: true,
                              child: ListView.builder(
                                itemCount: productIds.length,
                                itemBuilder: (context, index) => FutureBuilder(
                                    future: FirebaseFirestore.instance
                                        .collection(categoryProducts)
                                        .doc(productIds[index])
                                        .get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const WaitingWidget();
                                      } else if (snapshot.hasError) {
                                        return const LoadingErrorWidget();
                                      } else {
                                        Map<String, dynamic> data =
                                            snapshot.data!.data()!;
                                        Product product = Product.fromMap(data);
                                        int cartNo =
                                            currentCart[productIds[index]];
                                        cartNo != 0
                                            ? context
                                                .read<Cartprovider>()
                                                .addProduct(
                                                    productIds[index],
                                                    product.price * cartNo,
                                                    product.quantity)
                                            : 0;
                                        return (product.price == -1 ||
                                                product.price == 0)
                                            ? const SizedBox()
                                            // : Text(
                                            //     product.price.toString());
                                            : ListTile(
                                                leading: CustomImageWidget(
                                                  path: product.img[0][images],
                                                  width: 100,
                                                  height: 100,
                                                ),
                                                title: Text(product.title),
                                                subtitle: SizedBox(
                                                  width: 380,
                                                  height: 60,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "\$ ${product.price} * ",
                                                      ),
                                                      NumberInputField(
                                                        price: product.price,
                                                        initial: cartNo,
                                                        id: productIds[index],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                      }
                                    }),
                              ),
                            ),
                          ),
                        ),
                        FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection(users)
                                .doc(context.watch<UserProvider>().uid!)
                                .collection(cart)
                                .doc(total)
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const WaitingWidget();
                              } else if (snapshot.hasError) {
                                return const LoadingErrorWidget();
                              } else {
                                Map<String, dynamic>? data =
                                    snapshot.data!.data();
                                double money = data?[total] ?? 0;
                                return BottomColumnWidget(total: money);
                              }
                            })
                      ],
                    ),
                  );
                }
              }
            }),
      ),
    );
  }
}
