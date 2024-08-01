// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:restrosupply/data.dart';
// import 'package:restrosupply/functions/writeData.dart';
// import 'package:restrosupply/main.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// void writeCategory(BuildContext context) async {
//   try {
//     await storage.child("/data/category.json").putString(jsonEncode(categoryId),
//         format: firebase_storage.PutStringFormat.raw);
//     writeData(context);
//     ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(content: Text("Category Updated")));
//   } catch (e) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(e.toString())));
//   }
// }
