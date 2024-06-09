import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/screens/allProduct.dart';

late final dataList;

void main() async {
  final String response = await rootBundle.loadString("assets/data.json");
  final data = await jsonDecode(response);
  print(data);
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<String> appbarNameList = [
    "Home",
    "Products",
    "Partners",
    "About Us",
    "Referral",
    "Contact Us",
    "Flyers"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.yellow,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 18),
          displayLarge: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
            color: Theme.of(context).primaryColor,
          ),
          labelMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w100,
            color: Colors.black,
          ),
          labelSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          headlineMedium: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.w100),
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.accent,
          buttonColor: Colors.greenAccent,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          leading: isDevice(
            desktop: Image.network(
              "https://fastly.picsum.photos/id/477/200/200.jpg?hmac=pGA68LBET23UPGB7L8xL1pA7PYT_x7JazGX__CnlliU",
              fit: BoxFit.cover,
              width: 90,
              height: 90,
            ),
            mobile: Container(),
          ),
          backgroundColor: Colors.white,
          title: Center(
            child: isDevice(
              desktop: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Wrap(
                  alignment: WrapAlignment.spaceAround,
                  children: List.generate(
                    appbarNameList.length,
                    (index) => Text(
                      "    ${appbarNameList[index]}    ",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              mobile: Image.network(
                "https://fastly.picsum.photos/id/477/200/200.jpg?hmac=pGA68LBET23UPGB7L8xL1pA7PYT_x7JazGX__CnlliU",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        body: Container(),
      ),
    );
  }
}
