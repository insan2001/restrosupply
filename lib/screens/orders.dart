import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection(orders).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return WaitingWidget();
          } else if (snapshot.hasError) {
            return LoadingErrorWidget();
          } else {
            List<String> paymentIds = snapshot.data!.docs
                .map((value) => value.id)
                .toList()
                .reversed
                .toList();

            if (paymentIds.isEmpty) {
              return Text("No pending orders.");
            } else {
              return ListView.builder(itemBuilder: (context, index) {
                return FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection(users)
                        .doc(paymentIds[index])
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return WaitingWidget();
                      } else if (snapshot.hasError) {
                        return LoadingErrorWidget();
                      } else {
                        Map<String, dynamic> orderDetails =
                            snapshot.data!.data()!;
                        orderDetails[orders];
                        orderDetails['others'];
                        return ListView.builder(
                            itemBuilder: (context, index) {});
                      }
                    });
              });
            }
          }
        });
  }
}
