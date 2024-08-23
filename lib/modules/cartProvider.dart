import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class Cartprovider extends ChangeNotifier {
  Map<String, double> priceList = {};
  bool updated = false;
  double price = 0;

  addProduct(String key, double total, int qty) {
    priceList[key] = total;
    updated = false;
  }

  calculatePrice(String uid) {
    updated = true;
    double money = 0;
    for (double value in priceList.values) {
      money += value;
    }
    price = money;
    FirebaseFirestore.instance
        .collection(users)
        .doc(uid)
        .update({total: double.parse(price.toStringAsFixed(2))});

    notifyListeners();
  }
}
