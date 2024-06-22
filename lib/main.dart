import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/firebase_options.dart';
import 'package:restrosupply/route.dart';

Future<Map<String, dynamic>> fetchUsers(String url) async {
  var result = await http.get(Uri.parse(url));
  print(result.body);
  return jsonDecode(result.body);
}

Future<dynamic> downloadJsonFile() async {
  try {
    // Get the download URL
    // String downloadURL = await FirebaseStorage.instance
    //     .refFromURL("gs://restrosupplyhub.appspot.com/data/data.json")
    //     .getDownloadURL();
    String urlWithToken =
        "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/data%2Fdata.json?alt=media&token=467e8ed1-17cc-4f5b-b389-6cf21c324929";
    final response = await http.get(Uri.parse(urlWithToken));

    if (response.statusCode == 200) {
      // Convert the JSON to a Dart map
      print("object");
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load JSON file');
    }
  } catch (e) {
    print('Error: $e');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  // downloadJsonFile();

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Color.fromARGB(255, 14, 204, 52),
        scaffoldBackgroundColor: const Color.fromARGB(255, 248, 249, 250),
        textTheme: GoogleFonts.poppinsTextTheme(),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.accent,
          buttonColor: Colors.greenAccent,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      routerConfig: AppRouter().router,
    );
  }
}
