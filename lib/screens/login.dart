import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    if (data.name == mail && data.password == password) {
      return null;
    }
    return "Credentials doesn't match";
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (name != 'user') {
        return 'Username not found';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: FlutterLogin(
        title: companyName,
        logo: logoImage,
        onLogin: _authUser,
        onSubmitAnimationCompleted: () {
          setState(() {
            isAdmin = true;
          });
          context.go(RouteConstants().home);
        },
        onRecoverPassword: _recoverPassword,
        theme: LoginTheme(
          pageColorLight: Colors.blue,
          primaryColor: Theme.of(context).primaryColor,
          errorColor: Colors.deepOrange,
          titleStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          inputTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.blue,
            labelStyle: TextStyle(
                color: Theme.of(context).primaryColor), // Label text color
            errorStyle: TextStyle(color: Colors.red), // Error text color
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          textFieldStyle: TextStyle(color: Colors.white), // Input text color
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Text('Welcome!'),
      ),
    );
  }
}
