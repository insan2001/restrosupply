import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/main.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

void writeData(BuildContext context) async {
  try {
    await storage.child("/data/data.json").putString(jsonEncode(dataList),
        format: firebase_storage.PutStringFormat.raw);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Data Updated")));
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
