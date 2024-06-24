import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/firebase_options.dart';
import 'package:restrosupply/functions/readJsonFile.dart';
import 'package:restrosupply/route.dart';

import 'package:restrosupply/screens/error.dart';
import 'dart:html' as html;

final storage = FirebaseStorage.instance.ref();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  myWebsiteURL = html.window.location.href;

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJsonFile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: Image.network(
            logoImage,
            width: 100,
            height: 100,
          ));
        } else if (snapshot.hasData) {
          dataList = snapshot.data!;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              primaryColor: Color.fromARGB(255, 7, 85, 11),
              scaffoldBackgroundColor: const Color.fromARGB(255, 248, 249, 250),
              textTheme: GoogleFonts.robotoTextTheme(),
              buttonTheme: const ButtonThemeData(
                textTheme: ButtonTextTheme.accent,
                buttonColor: Colors.greenAccent,
              ),
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.green,
                brightness: Brightness.light,
              ),
            ),
            routerConfig: AppRouter().router,
          );
        }
        return const ErrorScreen();
      },
    );
  }
}
