import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/main.dart';
import 'package:restrosupply/modules/userProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> LoginUser(LoginData loginData, BuildContext context) async {
  String mail = loginData.name;
  String password = loginData.password;

  try {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: mail, password: password);
    context.read<UserProvider>().updateLogin(true);
    context.read<UserProvider>().updateUid(userCredential.user!.uid);

    Map<String, dynamic> data = (await FirebaseFirestore.instance
            .collection(users)
            .doc(userCredential.user!.uid)
            .get())
        .data()!;

    context.read<UserProvider>().updateLogin(true);
    context.read<UserProvider>().updateName(data[userName]);
    context.read<UserProvider>().updatePosition(data[position]);
    context.read<UserProvider>().updateProfile(data[userProfile]);
    context.read<UserProvider>().updateUid(userCredential.user!.uid);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(email, mail);
    prefs.setString(passText, password);

    return null;
  } catch (e) {
    return e.toString();
  }
}
