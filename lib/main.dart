import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restrosupply/screens/homeScreen.dart';

void main() async {
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
          scaffoldBackgroundColor: Colors.white,
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
