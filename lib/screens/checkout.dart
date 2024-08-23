import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/userProvider.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';
import 'package:restrosupply/widgets/checkout/billing.dart';
import 'package:restrosupply/widgets/checkout/orderSumary.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!context.watch<UserProvider>().login) {
      return const CustomScaffold(
          body: Center(child: Text("You need to login to checkout")));
    }
    return CheckoutPage();
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection(users)
              .doc(context.watch<UserProvider>().uid!)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const WaitingWidget();
            } else if (snapshot.hasError) {
              return const LoadingErrorWidget();
            } else {
              Map<String, dynamic> data = snapshot.data!.data()!;
              double? money = data[total];
              if (money == null) {
                return Center(
                  child: Text("You haven't checkout yet!"),
                );
              }
              double price = double.parse(money.toStringAsFixed(2));
              return LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > mobileWidth) {
                    // Desktop Layout
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: OrderSummary(price: price),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: BillingForm(price: price),
                          ),
                        ),
                      ],
                    );
                  } else {
                    // Mobile Layout
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          OrderSummary(price: price),
                          const SizedBox(height: 20),
                          BillingForm(price: price),
                        ],
                      ),
                    );
                  }
                },
              );
            }
          }),
    );
  }
}
