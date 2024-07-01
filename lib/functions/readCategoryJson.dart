import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restrosupply/main.dart';

Future<Map<String, String>?> readCategoryJson() async {
  try {
    final url = await storage.child("/data/category.json").getDownloadURL();
    print("here");
    final response = await http.get(Uri.parse(url));

    Map<String, String> data = {};
    if (response.statusCode == 200) {
      Map<String, dynamic> returnData =
          json.decode(response.body) as Map<String, dynamic>;
      for (String key in returnData.keys) {
        data[key] = returnData[key];
      }
      return data;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    print(2);
    return null;
  }
}
