import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class UserProvider extends ChangeNotifier {
  bool login = false;
  String position = defaultUser;
  String? profileImg;
  String name = "Unknown";
  String? uid;

  updateLogin(bool value) {
    login = value;
    notifyListeners();
  }

  updateUid(String neWUid) {
    uid = neWUid;
    notifyListeners();
  }

  updateName(String text) {
    name = text;
    notifyListeners();
  }

  updatePosition(String pos) {
    position = pos;
    notifyListeners();
  }

  updateProfile(String? img) {
    profileImg = img;
    notifyListeners();
  }
}
