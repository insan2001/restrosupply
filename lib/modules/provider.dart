import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class UserProvider extends ChangeNotifier {
  bool login = false;
  int position = defaultUser;
  String? profileImg;
  String? uid;

  updateLogin(bool value) {
    login = value;
    notifyListeners();
  }

  updatePosition(int num) {
    position = num;
    print("position updated: $position");
    notifyListeners();
  }

  updateProfile(String? img) {
    print("updated Url: $img");
    profileImg = img;
    notifyListeners();
  }
}
