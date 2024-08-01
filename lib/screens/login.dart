import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/functions/login.dart';
import 'package:restrosupply/main.dart';
import 'package:restrosupply/modules/userProvider.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      onLogin: (login) => LoginUser(login, context),
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
        String mail = signupData.name!;
        String passwd = signupData.password!;

        try {
          UserCredential userCredential = await auth
              .createUserWithEmailAndPassword(email: mail, password: passwd);
          String uid = userCredential.user!.uid;
          await userStore.doc(uid).set({
            position: defaultUser,
            userName: "Unknown",
            userProfile: emptyImage,
          });

          await FirebaseFirestore.instance
              .collection(users)
              .doc(userCredential.user!.uid)
              .set({
            userName: "Unknown",
            position: defaultUser,
            userProfile: emptyImage
          });

          context.read<UserProvider>().updateLogin(true);
          context.read<UserProvider>().updateName("Unknown");
          context.read<UserProvider>().updatePosition(defaultUser);
          context.read<UserProvider>().updateProfile(emptyImage);
          context.read<UserProvider>().updateUid(userCredential.user!.uid);

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(email, mail);
          prefs.setString(passText, passwd);
          return null;
        } catch (e) {
          return e.toString();
        }
      },
      onSubmitAnimationCompleted: () =>
          context.canPop() ? context.pop() : context.go(RouteConstants().home),
    );
  }
}
