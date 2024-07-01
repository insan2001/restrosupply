import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restrosupply/main.dart';

Future<Map<String, Map<String, List<List<dynamic>>>>?> readJsonFile() async {
  try {
    final url = await storage.child("/data/data.json").getDownloadURL();
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
    print(3);
    print(e);
    return null;
  }
}
