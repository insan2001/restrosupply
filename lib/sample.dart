// // // // // import 'dart:convert';
// // // // // import 'dart:io';

// // // // // import 'package:restrosupply/data.dart';

// // // // // // import 'package:restrosupply/data.dart';

// // // // // // void writeJson() async {
// // // // // //   File file = File('data.json');
// // // // // //   print("file readed");
// // // // // //   await file.writeAsString(jsonEncode(dataList));
// // // // // //   print("data written");
// // // // // // }

// // // // // Map<String, Map<String, List<Map<String, dynamic>>>> transformData(
// // // // //     Map<String, Map<String, List<List<dynamic>>>> originalData) {
// // // // //   return originalData.map((outerKey, innerMap) {
// // // // //     return MapEntry(
// // // // //       outerKey,
// // // // //       innerMap.map((innerKey, listOfLists) {
// // // // //         List<Map<String, dynamic>> transformedList = listOfLists.map((list) {
// // // // //           // Assuming that the list contains fixed number of elements and the keys can be assigned accordingly.
// // // // //           // If you have dynamic keys, adjust this part accordingly.
// // // // //           Map<String, dynamic> transformedMap = {};
// // // // //           for (int i = 0; i < list.length; i++) {
// // // // //             transformedMap['key$i'] = list[i];
// // // // //           }
// // // // //           return transformedMap;
// // // // //         }).toList();
// // // // //         return MapEntry(innerKey, transformedList);
// // // // //       }),
// // // // //     );
// // // // //   });
// // // // // }

// // // // // void main() async {
// // // // //   // Example data

// // // // //   // Transform the data
// // // // //   Map<String, Map<String, List<Map<String, dynamic>>>> transformedData =
// // // // //       transformData(dataList);

// // // // //   // Print the transformed data
// // // // //   // print(transformedData);
// // // // //   File file = File('data.json');
// // // // //   print("file readed");
// // // // //   await file.writeAsString(jsonEncode(transformedData));
// // // // //   print("data written");
// // // // // }

// // // import 'dart:convert';

// // // import 'package:firebase_core/firebase_core.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:restrosupply/data.dart';
// // // import 'package:restrosupply/firebase_options.dart';

// // // void main() async {
// // WidgetsFlutterBinding.ensureInitialized();
// // await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
// // // Stream documentStream = FirebaseFirestore.instance
// // //     .collection('dataList')
// // //     .doc('eyk3OBt2CGIQvWfnUtYC')
// // //     .snapshots();
// // try {
// //   // Convert the data to a format that Firestore can handle

// //   // Write data to Firestore
// //   await FirebaseFirestore.instance
// //       .collection("dataList")
// //       .doc("eyk3OBt2CGIQvWfnUtYC")
// //       .set(dataList)
// //       .onError((e, _) => print("Error writing document: $e"));

// //   print('Data written to Firestore');
// // } catch (e) {
// //   print('Failed to write data: $e');
// // }
// // //   // runApp(MyApp());
// // // }

// // // // class MyApp extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       title: 'Flutter Firestore',
// // // //       theme: ThemeData(
// // // //         primarySwatch: Colors.blue,
// // // //       ),
// // // //       home: MyHomePage(),
// // // //     );
// // // //   }
// // // // }

// // // // class MyHomePage extends StatefulWidget {
// // // //   @override
// // // //   _MyHomePageState createState() => _MyHomePageState();
// // // // }

// // // // class _MyHomePageState extends State<MyHomePage> {
// // // //   FirebaseFirestore firestore = FirebaseFirestore.instance;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _writeComplexData();
// // // //   }

// // // //   Future<void> _writeComplexData() async {}

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Firestore Example'),
// // // //       ),
// // // //       body: Center(
// // // //         child: Text('Writing complex data to Firestore...'),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // import 'dart:convert';
// // // // import 'dart:io';

// // // // import 'package:restrosupply/data.dart';

// // // // class ProductData {
// // // //   final String name;
// // // //   final String imageUrl;
// // // //   final bool stock;
// // // //   final bool pickup;
// // // //   final bool shipping;
// // // //   final List<String> details;

// // // //   ProductData({
// // // //     required this.name,
// // // //     required this.imageUrl,
// // // //     required this.stock,
// // // //     required this.pickup,
// // // //     required this.shipping,
// // // //     required this.details,
// // // //   });

// // // //   factory ProductData.fromJson(Map<String, dynamic> json) {
// // // //     return ProductData(
// // // //       name: json['name'],
// // // //       imageUrl: json['imageUrl'],
// // // //       stock: json['stock'],
// // // //       pickup: json['pickup'],
// // // //       shipping: json['shipping'],
// // // //       details: List<String>.from(json['details']),
// // // //     );
// // // //   }

// // // //   Map<String, dynamic> toJson() {
// // // //     return {
// // // //       'name': name,
// // // //       'imageUrl': imageUrl,
// // // //       'stock': stock,
// // // //       'pickup': pickup,
// // // //       'shipping': shipping,
// // // //       'details': details,
// // // //     };
// // // //   }
// // // // }

// // // // void main() async {
// // // //   // New map to store the transformed data
// // // //   Map<String, Map<String, List<ProductData>>> transformedData = {};

// // // //   // Transform the original data structure
// // // //   dataList.forEach((category, content) {
// // // //     Map<String, List<ProductData>> transformedContent = {};
// // // //     content.forEach((key, value) {
// // // //       List<ProductData> productDataList = [];
// // // //       for (var item in value) {
// // // //         ProductData productData = ProductData(
// // // //           name: item[0],
// // // //           imageUrl: item[1],
// // // //           stock: item[2],
// // // //           pickup: item[3],
// // // //           shipping: item[4],
// // // //           details: item.sublist(5).map((e) => e.toString()).toList(),
// // // //         );
// // // //         productDataList.add(productData);
// // // //       }
// // // //       transformedContent[key] = productDataList;
// // // //     });
// // // //     transformedData[category] = transformedContent;
// // // //   });

// // // //   // print(transformedData);
// // // //   File file = File('data.json');
// // // //   print("file readed");
// // // //   await file.writeAsString(jsonEncode(transformedData));
// // // //   print("data written");
// // // // }

// // import 'dart:convert';
// // import 'dart:io';

// // import 'package:restrosupply/data.dart';

// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:restrosupply/data.dart';
// // import 'package:restrosupply/main.dart';

// Future<Map<String, Map<String, List<List<dynamic>>>>?> readJsonFile() async {
//   try {
//     // final url = await ref.getDownloadURL();
//     final response = await http.get(Uri.parse(
//         "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/data%2Fdata.json?alt=media&token=467e8ed1-17cc-4f5b-b389-6cf21c324929"));

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonData =
//           json.decode(response.body) as Map<String, dynamic>;
//       late Map<String, Map<String, List<List<dynamic>>>> myData = {};
//       for (String key1 in jsonData.keys) {
//         Map<String, List<List<dynamic>>> tempMap = {};
//         for (String key2 in jsonData[key1].keys) {
//           List<List<dynamic>> tempList = [];
//           for (var data in jsonData[key1][key2]) {
//             tempList.add(data);
//           }
//           tempMap[key2] = tempList;
//         }
//         myData[key1] = tempMap;
//       }
//       // dataList = myData;
//       print(dataList.keys.toList());
//       print(myData.keys.toList());

//       File file = File('data1.json');
//       print("file readed");
//       await file.writeAsString(jsonEncode(dataList));
//       print("data written");
//       File file2 = File('data2.json');
//       print("file readed");
//       await file2.writeAsString(jsonEncode(myData));
//       print("data written");
//       return myData;
//     } else {
//       return null;
//     }
//   } catch (e) {
//     return null;
//   }
// }

// void main() async {
//   // Example input data

//   // New map to store the flattened data
//   // Map<String, List<Map<String, dynamic>>> transformedData = {};

//   // // Flatten the original data structure
//   // dataList.forEach((category, subCategories) {
//   //   List<Map<String, dynamic>> combinedList = [];
//   //   subCategories.forEach((subCategory, itemList) {
//   //     combinedList.addAll(itemList);
//   //   });
//   //   transformedData[category] = combinedList;
//   // });

//   // print(transformedData);
//   // File file = File('data.json');
//   // print("file readed");
//   // await file.writeAsString(jsonEncode(dataList));
//   // print("data written");
//   print("start");
//   await readJsonFile();
//   print("end");
// }
import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> uploadImages(String jsonFilePath) async {
  final file = File(jsonFilePath);
  final jsonData = json.decode(await file.readAsString());

  final FirebaseStorage storage = FirebaseStorage.instance;
  final List<dynamic> bagasseProducts = jsonData['Bagasse Products']['data'];

  for (var product in bagasseProducts) {
    if (product[1].isNotEmpty) {
      final imagePath = product[1];
      final fileName = imagePath.split('/').last;
      final ref = storage.ref().child('uploads/$fileName');
      final file = File(imagePath);

      try {
        await ref.putFile(file);
        final downloadUrl = await ref.getDownloadURL();
        print('Uploaded $fileName: $downloadUrl');
      } catch (e) {
        print('Error uploading $fileName: $e');
      }
    }
  }
}

void main() async {
  await Firebase.initializeApp();
  await uploadImages('data.json');
}
