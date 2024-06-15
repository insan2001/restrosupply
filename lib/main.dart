import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:restrosupply/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:restrosupply/screens/homeScreen.dart';

Future<Map<String, dynamic>> fetchUsers() async {
  var result = await http.get(Uri.parse(
      "https://firebasestorage.googleapis.com/v0/b/restrosupply.appspot.com/o/data.json?alt=media&token=ca12b951-c1f7-41f5-a57f-eee2a343d1a8"));
  // print(result.body);
  return jsonDecode(result.body);
}

void main() async {
  // final data = await fetchUsers();
  // print(data["Kraft Paper Fold Box"]["data"]);
  // data as Map<String, Map<String, dynamic>>;
  // print(data.runtimeType);
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.green,
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
        home: HomeScreen());
  }
}
