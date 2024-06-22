import 'package:flutter/material.dart';

class StateManager extends ChangeNotifier {
  bool isAdmin = false;

  void admin() {
    isAdmin = true;
    print("admin");
    notifyListeners();
  }
}
