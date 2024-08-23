import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/firebase_options.dart';
import 'package:restrosupply/modules/cartProvider.dart';
import 'package:restrosupply/modules/userProvider.dart';
import 'package:restrosupply/route.dart';

import 'dart:html' as html;

final storage = FirebaseStorage.instance.ref();

FirebaseAuth auth = FirebaseAuth.instance;
CollectionReference userStore = FirebaseFirestore.instance.collection(users);

// writeeData() async {
//   for (String key in mapData.keys) {
//     CollectionReference collection =
//         FirebaseFirestore.instance.collection(category);
//     Map<String, dynamic> data = Category.fromMap(mapData[key]).toJson();
//     for (Map<String, dynamic> product in data[categoryProducts]) {
//       print(product);
//       try {
//         await collection
//             .doc(key)
//             .collection(key)
//             .doc(replaceEverything(product[titlee]))
//             .set({
//           titlee: product[titlee],
//           images: product[images][0][images],
//         });
//       } catch (_) {
//         print(product[titlee]);
//       }
//       try {
//         product[location] = [key, replaceEverything(product[titlee])];
//         await FirebaseFirestore.instance
//             .collection(categoryProducts)
//             .doc(replaceEverything(product[titlee]))
//             .set(product);
//       } catch (_) {
//         print(product[titlee]);
//       }
//     }
//     try {
//       await collection.doc(key).set({
//         categoryImage: data[categoryImage],
//         categoryName: data[categoryName],
//       });
//     } catch (e) {
//       print(key);
//     }
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_live_51PqmRqBCteq3n7P9q3kvJ48G9T2y6ccwdCZliWQynzG3zxG6t8wHJhTJm4eo1h9L78Vhu6HfomOLkmwHvJE4s2nS00VhfJxKJW";
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  myWebsiteURL = html.window.location.href;
  // await writeeData();
  // print("data written");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => Cartprovider())
      ],
      child: MainApp(),
    ),
  );
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
        primaryColor: const Color.fromARGB(255, 6, 154, 14),
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
}
