import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/firebase_options.dart';
import 'package:restrosupply/route.dart';
import 'package:http/http.dart' as http;
import 'package:restrosupply/screens/error.dart';
import 'dart:html' as html;

final ref = FirebaseStorage.instance.ref().child('/data/data.json');

Future<Map<String, Map<String, List<List<dynamic>>>>?> readJsonFile() async {
  try {
    final url = await ref.getDownloadURL();
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData =
          json.decode(response.body) as Map<String, dynamic>;
      late Map<String, Map<String, List<List<dynamic>>>> myData = {};
      for (String key1 in jsonData.keys) {
        Map<String, List<List<dynamic>>> tempMap = {};
        for (String key2 in jsonData[key1].keys) {
          List<List<dynamic>> tempList = [];
          for (var data in jsonData[key1][key2]) {
            tempList.add(data);
          }
          tempMap[key2] = tempList;
        }
        myData[key1] = tempMap;
      }
      return myData;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

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
          return Image.asset(logoImage);
        } else if (snapshot.hasData) {
          dataList = snapshot.data!;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              primaryColor: const Color.fromARGB(255, 14, 204, 52),
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
