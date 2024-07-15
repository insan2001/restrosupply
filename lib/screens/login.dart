import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/main.dart';
import 'package:restrosupply/modules/provider.dart';
import 'package:restrosupply/routeConstants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      onLogin: (loginData) async {
        String email = loginData.name;
        String password = loginData.password;

        try {
          UserCredential userCredential = await auth.signInWithEmailAndPassword(
              email: email, password: password);
          context.read<UserProvider>().updateLogin(true);
          Map<String, dynamic>? data = (await FirebaseFirestore.instance
                  .collection(users)
                  .doc(userCredential.user!.uid)
                  .get())
              .data();
          if (data != null) {
            context.read<UserProvider>().updatePosition(data[position]);
          } else {
            print("no data");
          }
          context
              .read<UserProvider>()
              .updateProfile(userCredential.user!.photoURL);

          return null;
        } catch (e) {
          return e.toString();
        }
      },
      onRecoverPassword: (email) async {
        try {
          await auth.sendPasswordResetEmail(email: email);
          return null;
        } catch (e) {
          return e.toString();
        }
      },
      onSignup: (signupData) async {
        if (signupData.name == null || signupData.password == null) {
          return null;
        }
        String email = signupData.name!;
        String password = signupData.password!;

        try {
          UserCredential userCredential = await auth
              .createUserWithEmailAndPassword(email: email, password: password);
          String uid = userCredential.user!.uid;
          userStore.doc(uid).set({position: defaultUser});
          return null;
        } catch (e) {
          return e.toString();
        }
      },
      onSubmitAnimationCompleted: () => context.go(RouteConstants().home),
    );
  }
}
