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
// // // // //             transformedMap['key\\\$i'] = list[i];
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
// //       .onError((e, _) => print("Error writing document: \\\$e"));

// //   print('Data written to Firestore');
// // } catch (e) {
// //   print('Failed to write data: \\\$e');
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
// import 'dart:convert';
// import 'dart:io';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// Future<void> uploadImages(String jsonFilePath) async {
//   final file = File(jsonFilePath);
//   final jsonData = json.decode(await file.readAsString());

//   final FirebaseStorage storage = FirebaseStorage.instance;
//   final List<dynamic> bagasseProducts = jsonData['Bagasse Products']['data'];

//   for (var product in bagasseProducts) {
//     if (product[1].isNotEmpty) {
//       final imagePath = product[1];
//       final fileName = imagePath.split('/').last;
//       final ref = storage.ref().child('uploads/\\\$fileName');
//       final file = File(imagePath);

//       try {
//         await ref.putFile(file);
//       } catch (_) {}
//     }
//   }
// }

// void main() async {
//   await Firebase.initializeApp();
//   await uploadImages('data.json');
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/category.dart';

Map<String, dynamic> mapData = {
  "Bagasse Products": {
    "data": [
      [
        "6\" - Bagasse Square Plate ",
        "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Fbaggage-0.jpg?alt=media&token=6d86a12e-cb12-4b4c-897d-e22b87b33a61",
        true,
        false,
        true,
        "6\" - Bagasse Square Plate"
      ],
      [
        "8X8-3 Compartment Bagasse Brown Clamshell Container ",
        "",
        true,
        true,
        false,
        "8X8-3 Compartment Bagasse Brown Clamshell Container"
      ],
      [
        "Bagasse Brown Container with plastic lid - 32oz - 1 Comb ",
        "",
        true,
        false,
        true,
        "Bagasse Brown Container with plastic lid - 32oz - 1 Comb"
      ],
      [
        "9\"-3 Compartment Bagasse Plates - 500ct/CS ",
        "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Fbaggage-3.png?alt=media&token=3bb50b87-239c-41b0-9bd9-c4a7b3f82ca9",
        true,
        false,
        true,
        "PO#: 20012",
        "Pacing:10X50 CT",
        "Price \$ 47.19"
      ],
      [
        "9X9 - 3 Compartment Bagasse Light Brown Clamshell Container ",
        "assets/SugarcaneCompostableProducts/5.png",
        true,
        false,
        true,
        "9X9 - 3 Compartment Bagasse Light Brown Clamshell Contai",
        "Price \$ 52.89"
      ],
      [
        " Clear Lid For 24/32oz Bagasse Round Bowl - 600ct/CS ",
        "assets/SugarcaneCompostableProducts/6.png",
        true,
        false,
        true,
        "PO#: 20039",
        "Packing: 12X50 CT",
        "Price \$ 108.55"
      ],
      [
        "9X6 Bagasse Clamshell Container - 200ct/CS ",
        "",
        true,
        true,
        true,
        "PO#: 20025",
        "Packing: 4X50 CT"
      ],
      [
        "10\" - 3 Compartment Bagasse Plates ",
        "assets/SugarcaneCompostableProducts/8.png",
        true,
        true,
        true,
        "10\" - 3 Compartment Bagasse Plates"
      ],
      [
        "Bagasse Brown Container with plastic lid - 28oz - 1 Comb - 150ct/CS ",
        "",
        true,
        true,
        true,
        "PO#: 20003",
        "Packing: 3X50 CT"
      ],
      [
        "10\" - 3 Compartment Bagasse Light Brown Plates - 200ct/CS ",
        "",
        true,
        true,
        true,
        "PO#: 20014H"
      ],
      [
        "9\" - 3 Compartment Bagasse Light Brown Plates ",
        "",
        true,
        true,
        true,
        "9\" - 3 Compartment Bagasse Light Brown Plates"
      ],
      [
        "12.5\" - Bagasse Oval Plate - 500ct/CS ",
        "",
        true,
        true,
        true,
        "PO#: 20016",
        "Packing: 10X50 CT"
      ],
      [
        "8X8 Bagasse Brown Clamshell Container ",
        "assets/SugarcaneCompostableProducts/13.png",
        true,
        false,
        true,
        "8X8 Bagasse Brown Clamshell Container",
        "Price \$49.40"
      ],
      [
        "8\"- Bagasse Square Plate - 1000ct/CS ",
        "",
        true,
        false,
        true,
        "PO#: 20018",
        "Packing: 20X50 CT",
        "Price \$ 85.70"
      ],
      [
        "7\" Bagasse Plates ",
        "assets/SugarcaneCompostableProducts/15.png",
        true,
        false,
        true,
        "7\" Bagasse Plates",
        "Price \$ 53.17"
      ],
      [
        "8.5X8.5 -1  Bagasse Light Brown Clamshell Container ",
        "assets/SugarcaneCompostableProducts/16.png",
        true,
        false,
        true,
        "8.5X8.5 -1  Bagasse Light Brown Clamshell Container",
        " \$ 45.70"
      ],
      [
        " 48oz Round Bowl - Bagasse - 300ct/CS ",
        "assets/SugarcaneCompostableProducts/17.png",
        true,
        true,
        true,
        "PO#: 20041",
        "Packing: 6X50 CT"
      ],
      [
        "Bagasse Brown Container with plastic lid - 24 oz - 2 Comb - 150ct/CS ",
        "",
        true,
        true,
        true,
        "PO#: 20002",
        "Packing: 3X50 CT"
      ],
      [
        "9X6 - 2 Compartment Bagasse Light Brown Clamshell Container - 200ct/CS ",
        "",
        true,
        true,
        true,
        "PO#:20026H",
        "Packing: 4X50 CT"
      ],
      [
        "Bagasse Brown Container with plastic lid - 28oz - 2 Comb ",
        "",
        true,
        true,
        true,
        "Bagasse Brown Container with plastic lid - 28oz - 2 Comb"
      ],
      [
        "9X9 Bagasse Clamshell Container - 200ct/CS ",
        "assets/SugarcaneCompostableProducts/21.png",
        true,
        true,
        true,
        "PO#: 20027",
        "Packing: 4X50 CT"
      ],
      [
        "10\" - Bagasse Square Plate - 500ct/CS ",
        "",
        true,
        true,
        true,
        "PO#: 20019",
        "Packing: 10X50 CT"
      ],
      [
        "9\" Bagasse Light Brown Plates ",
        "assets/SugarcaneCompostableProducts/23.png",
        true,
        true,
        true,
        "9\" Bagasse Light Brown Plates"
      ],
      [
        "9X9 - 3 Compartment Bagasse Clamshell Container - 200ct/CS ",
        "assets/SugarcaneCompostableProducts/24.png",
        true,
        true,
        true,
        "PO#: 20028",
        "Packing: 4X50 CT"
      ],
      [
        "9X6 - 2 Compartment Bagasse Clamshell Container ",
        "",
        true,
        true,
        true,
        "9X6 - 2 Compartment Bagasse Clamshell Container"
      ],
      [
        "10\" Bagasse Plates ",
        "assets/SugarcaneCompostableProducts/26.png",
        true,
        true,
        true,
        "10\" Bagasse Plates"
      ],
      [
        "Bagasse Brown Container with plastic lid - 32oz - 2 Comb - 150ct/CS ",
        "",
        true,
        true,
        true,
        "PO#: 20006",
        "Packing: 3X50 CT"
      ],
      [
        "6\" Bagasse Plates ",
        "assets/SugarcaneCompostableProducts/28.png",
        true,
        true,
        true,
        "6\" Bagasse Plates"
      ],
      [
        "8\" - Bagasse Light Brown Square Plate ",
        "",
        true,
        true,
        true,
        "8\" - Bagasse Light Brown Square Plate"
      ],
      [
        "8.5X8.5 Bagasse Clamshell Container - 200ct/CS ",
        "assets/SugarcaneCompostableProducts/30.png",
        true,
        true,
        true,
        "PO#: 20024",
        "Packing: 4X50 CT"
      ],
      [
        "7\"X5.5\"X2.8\" Bagasse Light Brown Clamshell Container ",
        "",
        true,
        true,
        true,
        "7\"X5.5\"X2.8\" Bagasse Light Brown Clamshell Container"
      ],
      [
        " 16oz Round Bowl - Bagasse - 600ct/CS ",
        "assets/SugarcaneCompostableProducts/32.png",
        true,
        true,
        true,
        "16oz Round Bowl - Bagasse - 6X100CT/CS",
        "Packing: 12X50 CT"
      ],
      [
        "8X8 - 3 Compartment Bagasse Clamshell Container ",
        "",
        true,
        true,
        true,
        "8X8 - 3 Compartment Bagasse Clamshell Container"
      ]
    ],
    "CategoryImage": [
      [
        "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Fbaggase.jpeg?alt=media&token=50b9778d-1888-4920-82d3-6bec069ae42f",
        "Sugarcane Compostable Products"
      ]
    ]
  },
  "Kraft Paper Fold Box": {
    "data": [
      [
        "Wisdom - #8 Kraft Paper Fold Box - 50X04ct/CS",
        "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Fkraft-0.png?alt=media&token=253c417c-dbe4-4247-b26e-46ef137a1efc",
        true,
        true,
        true,
        "PO#: 90008",
        " Packing: 4X50ct",
        "Price\$39.99"
      ],
      [
        "Wisdom - #1 Kraft Paper Fold Box - 50X04ct/CS",
        "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Fkraft-1.jpg?alt=media&token=8e7b6d9a-e2e6-461f-b301-37330754088a",
        true,
        true,
        true,
        "PO#: 90001",
        "Packing: 4X50ct",
        "Price\$39.99"
      ],
      [
        "Wisdom - #2 Kraft Paper Fold Box - 50X04ct/CS",
        "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Fkraft-2.png?alt=media&token=32f70d9f-db7d-4ca2-a49f-e454699f4324",
        true,
        true,
        true,
        "PO#: 90002",
        " Packing:50X04ct",
        " Price\$38.99"
      ],
      [
        "Wisdom - #4 Kraft Paper Fold Box - 40X04ct/CS",
        "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Fkraft-3.webp?alt=media&token=595d5b07-746b-47b6-8e15-e56fa01cf289",
        true,
        true,
        true,
        "Wisdom-#4 Kraft PaperFold Box",
        " Packing:40X04ct",
        " Price\$48.99"
      ],
      [
        "Wisdom - #3 Kraft Paper Fold Box - 50X04ct/CS",
        "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Fkraft-4.webp?alt=media&token=a60c7cd9-a07d-4134-9a74-a8b41c0ee4f1",
        true,
        true,
        true,
        "PO#: 90003",
        " Packing:50X04ct",
        " Price\$48.99"
      ]
    ],
    "CategoryImage": [
      [
        "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Fkraft.jpg?alt=media&token=f2b357be-7922-4e25-8049-00ce3989bd95",
        "Kraft Paper Fold Box"
      ]
    ]
  },
  "Aluminum Foil": {
    "data": [
      [
        "Full Size Lid For Aluminium Steam Pan - Little Packing - 100ct/CS ",
        "",
        false,
        false,
        false,
        "PO#  10045",
        "Packing: 20X5ct"
      ],
      [
        "Foil Laminated Lid for 1.5 LB Oblong - HZJ310LH ",
        "assets/FoilContainerandLid/-5067629789285023182.png",
        true,
        false,
        true,
        "PO#  10020",
        "Price \$18.20"
      ],
      [
        "Plastic Dome Lid For 1 lb Oblong Container 500ps -HZJ300LD ",
        "assets/FoilContainerandLid/1530432896468087288.png",
        true,
        false,
        true,
        "PO#  10016",
        "Packing:500ct/CS",
        "Price \$13.50"
      ],
      [
        "Foil Laminated Lid for 2.5 LB Oblong - HZJ320LH ",
        "assets/FoilContainerandLid/7656599161876728874.png",
        true,
        false,
        true,
        "PO#  10023",
        "Packing:500ct/cs",
        "Price \$22.95"
      ],
      [
        "Foil - 8''  Heavy Round  - Aluminium Foil Container - HZJ208H ",
        "assets/FoilContainerandLid/-3415642595002051157.png",
        true,
        false,
        true,
        "PO#  10007",
        "Packing:500ct/CS",
        "Price \$68.90"
      ],
      [
        "Foil Full Size Deep - Aluminium Steam Pan - HZJ520 ",
        "assets/FoilContainerandLid/1255525702905351835.png",
        true,
        false,
        true,
        "PO#  10030",
        "Packing: 50ct/cs",
        "Price \$59.80"
      ],
      [
        "Foil - 2.5 lb Oblong - Aluminium Foil Container - HZJ320 ",
        "assets/FoilContainerandLid/-2103550421259601792.png",
        true,
        false,
        true,
        "PO#  10021",
        "Packing: 500ct/CS",
        "Price \$62.99"
      ],
      [
        "Foil -12\" Aluminum Foil Roll  -Heave - 200M - HZJ1220H ",
        "",
        false,
        false,
        false,
        "Foil-12\" Aluminum Foil-Heave-200M",
        "Price \$0.00"
      ],
      [
        "Foil Half Size Medium - Aluminium Steam Pan - HZJ410 ",
        "assets/FoilContainerandLid/-8030245296767403527.png",
        true,
        false,
        true,
        "Foil Half Size Medium - Aluminium Steam Pan - HZJ410",
        "Packing:100ct/CS",
        "Price \$39.15"
      ],
      [
        "Foil Laminated Lid for 1 LB Oblong - HZJ300LH ",
        "assets/FoilContainerandLid/6347262693758708240.png",
        true,
        false,
        true,
        "Foil Laminated Lid for 1LB Oblong - HZJ300",
        "Price \$13.50LH",
        "Packing: 500ct/CS",
        "Price \$13.50"
      ],
      [
        "Foil Full Size Shallow - Aluminium Steam Pan - HZJ500 ",
        "assets/FoilContainerandLid/-1110505155769785803.png",
        true,
        false,
        true,
        "Foil Full Size Shallow - Aluminium Steam Pan - HZJ500",
        "PO#: 10028",
        "Packing: 50 Pcs",
        "Price \$55.90"
      ],
      [
        "Plastic Dome Lid For 2.25 lb Oblong Container 500ps - HZJ320LD ",
        "assets/FoilContainerandLid/-1310506819108450046.png",
        true,
        true,
        true,
        "PO#:10023",
        "Dome Lids for 1.5 lb Oblong Pan - Clear",
        "Packing: 500ct/CS",
        "Price \$22.95"
      ],
      [
        "Half Size Lid For Aluminium Steam Pan - HZJ400L ",
        "assets/FoilContainerandLid/6711033363432196810.png",
        true,
        false,
        true,
        "PO#  10027",
        "Packing: 500ct/CS",
        "Price \$21.60"
      ],
      [
        "Foil Half Size Deep - Aluminium Steam Pan - HZJ420 ",
        "assets/FoilContainerandLid/8215789381350695195.png",
        true,
        false,
        true,
        "PO#  10026",
        "Packing: 100ct/CS",
        "Price \$40.50"
      ],
      [
        "Foil - 9\" Round - Plastic Dome  Lid - HZJ209LD ",
        "assets/FoilContainerandLid/6680531210793237110.png",
        true,
        false,
        true,
        "PO#:10014",
        "Packing: 500ct/CS",
        "Price \$35.10"
      ],
      [
        "Foil - 7\" Foil Laminated Board Lid - HZJ207LH ",
        "assets/FoilContainerandLid/8021845946169151237.png",
        true,
        false,
        true,
        "PO#  10005",
        "Packing: 500ct/CS",
        "Price \$18.90"
      ],
      [
        "Foil - 1 lb Oblong-Aluminium Foil Container - HZJ300 ",
        "assets/FoilContainerandLid/-1093848701009628569.png",
        true,
        false,
        true,
        "PO#  10015",
        "Packing: 500ct/CS",
        "Price \$36.40"
      ],
      [
        "Foi l-18\" Aluminum Foil Roll - Standard -18\"X100M - HZJ1810 ",
        "",
        true,
        true,
        true,
        "PO#  10036",
        "Packing: 6 Rolls/CS"
      ],
      [
        "Foil - 9\" Foil Laminated Board Lid - HZJ209LH ",
        "assets/FoilContainerandLid/-1738084204047814998.png",
        true,
        true,
        true,
        "PO#  10013",
        "Packing: 500ct/CS"
      ],
      [
        "Foil - 8\"Round Foil Laminated Board Lid - HZJ208LH ",
        "assets/FoilContainerandLid/-1075690813294322601.png",
        true,
        true,
        true,
        "PO#  10009",
        "Packing: 500ct/CS"
      ],
      [
        "Aluminium Rectangle Steam Pan - 4332 - 50ct/CS ",
        "assets/FoilContainerandLid/4241294205298748341.png",
        true,
        false,
        true,
        "PO#: 10046",
        "Packing: 50ct/PCS",
        "Price \$ 57.17"
      ],
      [
        "Half Size Lid For Aluminium Steam Pan - Little Packing - 400ct/CS ",
        "",
        true,
        false,
        true,
        "PO#  10044",
        "Packing: 40X10ct",
        "Price \$ 131.43"
      ],
      [
        "Foil Half Size Medium - Aluminium Steam Pan - Little Packing - 100ct/CS ",
        "assets/FoilContainerandLid/5472468513865358023.png",
        true,
        false,
        true,
        "PO#  10040",
        "Packing: 10X10ctPO#:: 10039",
        "Price \$ 51.09"
      ],
      [
        "Foil Half Size Deep - Aluminium Steam Pan - Little Packing - 100ct/CS ",
        "assets/FoilContainerandLid/-6109089530879734048.png",
        true,
        false,
        true,
        "PO#  10040",
        "Packing: 10X10ct",
        "Price \$ 55.60"
      ],
      [
        "Foil Full Size Deep - Aluminium Steam Pan - Little Packing -50ct/CS ",
        "assets/FoilContainerandLid/2092562085299589936.png",
        true,
        false,
        true,
        "PO#  10043",
        "Packing: 10X5ct",
        "Price \$ 74.40"
      ],
      [
        "Foil Full Size Medium - Aluminium Steam Pan - Little Packing - 50ct/CS ",
        "",
        true,
        false,
        true,
        "PO# : 10042",
        "Packing: 10X5ct",
        "Price \$ 73.75"
      ],
      [
        " Roaster Pans/Oval Pan - HZJ - 4399 - 100ct/CS ",
        "",
        false,
        false,
        false,
        "Roaster Pans/Oval Pan-HZJ-4399",
        "Packing: 50ct/CS",
        "Price \$ 0.00"
      ],
      [
        "Roaster Pans/Oval Pan - HZJ - 7500 - 50ct/CS ",
        "assets/FoilContainerandLid/8947007543715341845.png",
        true,
        false,
        true,
        "PO# : 10047",
        "Packing: 50ct/CS",
        "Price \$ 65.76"
      ],
      [
        "Plastic Dome Lid For 1.5lb Oblong Container 500ps -HZJ310LD ",
        "assets/FoilContainerandLid/-3002679085674920573.png",
        true,
        false,
        true,
        "PO# : 10019",
        "Packing: 500ct/CS",
        "Price \$15.60"
      ],
      [
        "Plastic Dome Lid For Half Size Foil Pan -100pcs - HZJ400LD ",
        "assets/FoilContainerandLid/2902447806978067505.png",
        true,
        false,
        true,
        "PO#  10047",
        "Packing: 100ct/CS",
        "Price \$25.98"
      ],
      [
        "Foil Full Size Medium - Aluminium Steam Pan - HZJ510 ",
        "assets/FoilContainerandLid/-4500196639674879397.png",
        true,
        false,
        true,
        "PO#  10029",
        "Packing: 50ct/CS",
        "Price \$58.50"
      ],
      [
        "Foil - 7 '- Heavy-'Round - Aluminium Foil Container - HZJ207H ",
        "assets/FoilContainerandLid/3996725390460646488.png",
        true,
        false,
        true,
        "PO#  10002",
        "Packing: 500PCS",
        "Price \$48.60"
      ],
      [
        "Foil -12\" Aluminum Foil Roll - Standard - 12\"X200M - HZJ1220 ",
        "",
        true,
        true,
        true,
        "PO#  10034",
        "Packing: 6 Rolls/CS"
      ],
      [
        "Foil - 8\" Round - Plastic Dome  Lid - HZJ208LD ",
        "assets/FoilContainerandLid/-211806971462013436.png",
        true,
        true,
        true,
        "PO#  10010",
        "Packing: 500ct/CS"
      ],
      [
        "Full Size Lid For Aluminium Steam Pan - HZJ500L ",
        "assets/FoilContainerandLid/452735009445000207.png",
        true,
        false,
        true,
        "PO#  10031",
        "Packing: 50PCS",
        "Price \$29.90"
      ],
      [
        "Foil - 7 '- Standard Round - Aluminium Foil Container - HZJ207 ",
        "assets/FoilContainerandLid/-7065069904968209680.png",
        true,
        true,
        true,
        "PO#  10002",
        "Packing: 500ct/CsWeight: 7.5g"
      ],
      [
        "Foil - 9' Heavy Round - Aluminium Foil Container - HZJ209H ",
        "assets/FoilContainerandLid/2538429122435449628.png",
        true,
        false,
        true,
        "PO#  10011",
        "Packing: 500ct/CS",
        "Price \$87.75"
      ],
      [
        "Foil -18\" Aluminum Foil Roll - Heave -18\"X100M - HZJ1810H ",
        "",
        true,
        false,
        true,
        "PO#  10037",
        "Packing: 6 Rolls",
        "Price \$124.44"
      ],
      [
        "Foil Half Size Shallow - Aluminium Steam Pan - HZJ400 ",
        "assets/FoilContainerandLid/-249417970706165275.png",
        true,
        false,
        true,
        "PO#  10024",
        "Packing: 100ct/CS",
        "Price \$39.15"
      ],
      [
        "Foil - 1.5 lb Oblong - Aluminium Foil Container - HZJ310 ",
        "assets/FoilContainerandLid/-1027191170826474963.png",
        true,
        false,
        true,
        "PO#  10018",
        "Packing: 500PCS",
        "Price \$49.60"
      ]
    ],
    "CategoryImage": [
      [
        "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Faluminum.jpg?alt=media&token=169f1e58-ba49-490c-83df-fa31d4d8831a",
        "Foil Container and Lid"
      ]
    ]
  },
  "Paper Shopping Bag": {
    "data": [
      [
        "Kraft Paper Bags with Twisted Handles - 10X6X13 - 250ct/CS ",
        "assets/PaperShoppingBag/-1918688910506603471.png",
        false,
        true,
        true,
        "Kraft Paper Handle Bag-10\"X6X13\"-250 ct",
        "Packing: 250ct/CS",
        "Paper Bags",
        "Price \$42.49"
      ],
      [
        "Kraft Paper Bags with Twisted Handles - 13X7X17 - 200ct/CS ",
        "assets/PaperShoppingBag/6792400537161498743.png",
        true,
        false,
        true,
        "Kraft Paper Bags with Twisted Handles - 13X7X17",
        "Packing: 200PCS",
        "Paper Bags",
        "Price \$53.74"
      ],
      [
        "White Paper Bags with Twisted Handles - 10X6X13 - 250ct/CS ",
        "assets/PaperShoppingBag/-9004487357085058787.png",
        true,
        false,
        true,
        "PO#: PB009W",
        "Packing: 250ct/CS",
        "Paper Bags",
        "Price \$64.28"
      ],
      [
        "Kraft Paper Bags with Twisted Handles - 13X7X13 - 200ct/CS ",
        "assets/PaperShoppingBag/-3968352626926764221.png",
        true,
        false,
        true,
        "Kraft Paper Bags with Twisted Handles - 13X7X13",
        "Packing: 200PCS",
        "Paper Bags",
        "Price \$54.32"
      ],
      [
        " Paper Bags with Twisted Handles -White - 13X7X17 - 200ct/CS ",
        "assets/PaperShoppingBag/7645501136332211547.png",
        true,
        false,
        true,
        "PO#: PB011W",
        "Packing: 200PCS",
        "Paper Bags",
        "Price \$76.48"
      ],
      [
        "  Kraft Paper Bags with Twisted Handles - 10X6X13 - 250ct/CS ",
        "assets/PaperShoppingBag/-7672088551004513088.png",
        true,
        false,
        true,
        "PO#:PB003",
        "Packing: 250PCS",
        "Paper Bags",
        "Price \$42.49"
      ],
      [
        "White Paper Bags with Twisted Handles - 8X4.5X10.6 - 250PCS",
        "assets/PaperShoppingBag/8546618619284421840.png",
        true,
        false,
        true,
        "PO#: PB008W",
        "Packing: 250PCS",
        "Paper Bags",
        "Price \$49.61"
      ],
      [
        "  Kraft Paper Bags with Twisted Handles - 13X8.5X13 - 250ct/CS ",
        "assets/PaperShoppingBag/2708982093779888984.png",
        true,
        false,
        true,
        "PO# PB004",
        "Packing: 250PCS",
        "Paper Bags",
        "Price \$51.84"
      ],
      [
        "Kraft Paper Bags with Twisted Handles - 8X4.5X10.6 - 250ct/CS ",
        "assets/PaperShoppingBag/6651280695903989693.png",
        true,
        true,
        true,
        "PO#: PB001S",
        "Packing: 250ct/CS",
        "Paper Bags"
      ],
      [
        "  Kraft Paper Bags with Twisted Handles - 13X7X17 - 250ct/CS ",
        "assets/PaperShoppingBag/-8047310861267980810.png",
        true,
        true,
        true,
        "PO#: PB006",
        "Packing: 250ct/CS",
        "Paper Bags"
      ],
      [
        "White Paper Bags with Twisted Handles - 13X7X13 -200ct/CS ",
        "assets/PaperShoppingBag/9164454087588030262.png",
        true,
        true,
        true,
        "PO#: PB010W",
        "Packing: 200ct/CS",
        "Paper Bags"
      ]
    ],
    "CategoryImage": [
      [
        "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Fpaper.png?alt=media&token=8b554942-ab13-4910-9a4d-74dda63d4212",
        "Paper Shopping Bag"
      ]
    ]
  },
  "Paper Coffee cup": {
    "data": [
      [
        " 8oz Ripple Wall Paper Cups - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/-2827500280028018178.png",
        false,
        false,
        false,
        "PO#: 30014",
        "Packing: 20X50 CT"
      ],
      [
        " 10 - 24 oz Kraft Sleeve For Hot Paper Cups - 1000ct/cs ",
        "assets/PaperCoffeeCupandLid/-6045891955566277026.png",
        true,
        false,
        true,
        "PO#: 30012",
        "Packing: 1000 PCS",
        "Price \$35.73"
      ],
      [
        " 10oz Ripple Wall Paper Cups - 500ct/CS ",
        "assets/PaperCoffeeCupandLid/7008639498803102390.png",
        false,
        false,
        false,
        "PO#: 30015",
        "Packing: 20X25 CT",
        "Price \$0.00"
      ],
      [
        " 7 oz Paper Cup - Printed - 3000ct/CS ",
        "assets/PaperCoffeeCupandLid/9129364089255799879.png",
        true,
        false,
        true,
        "PO#: 30023",
        "Packing:: 60X50CT",
        "Price \$87.49"
      ],
      [
        " 20 oz White  Paper Cups - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/9193451214144446244.png",
        true,
        false,
        true,
        "PO#: 30024",
        "Packing: 20X50 CT",
        "Price \$78.39"
      ],
      [
        " 4oz Paper Cup - Printed - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/5290209890624805297.png",
        true,
        false,
        true,
        "PO#: 30006",
        "Packing: 20X50 CT",
        "Price \$28.57"
      ],
      [
        " 4oz White Hot Paper Cups - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/7004026186944813999.png",
        true,
        false,
        true,
        "PO#: 30001",
        "Price \$27.17"
      ],
      [
        " 10o z Paper Cups - Printed - 1000 PCS",
        "assets/PaperCoffeeCupandLid/-2825072995049149939.png",
        true,
        false,
        true,
        "PO#: 30008",
        "Packing: 20X50 CT",
        "Price \$61.47"
      ],
      [
        " 12oz Ripple Wall Paper Cups - 500ct/CS ",
        "assets/PaperCoffeeCupandLid/7337705008364489869.png",
        true,
        false,
        true,
        "PO#: 30016",
        "Packing: 20X25ct",
        "Price \$71.41"
      ],
      [
        " White Flat Lid for 10-20oz Cup - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/7729853231948428237.png",
        true,
        false,
        true,
        "PO#: 30022",
        "Packing: 20X50 CT",
        "Price \$37.18"
      ],
      [
        " 8oz Paper Cups - Printed - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/-324553280787597343.png",
        true,
        true,
        true,
        "PO#: 30007",
        "Packing: 20X50 CT"
      ],
      [
        " 6oz Paper Cup - White - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/-7548750451900188014.png",
        false,
        false,
        false,
        "PO#30005",
        "Packing: 20X50 CT"
      ],
      [
        " Black Dome Tear Lid for 10-20oz Paper Cup - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/-1001736913267167441.png",
        false,
        false,
        false,
        "PO#: 30020",
        "Packing: 20X50 CT",
        "Price \$0.00"
      ],
      [
        "  oz White Paper Cup - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/1360314386928355401.png",
        true,
        true,
        true,
        "PO#: 30003",
        "Packing: 20X50 CT"
      ],
      [
        " White Dome Lid for 8oz Paper Cup - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/2891123925828032781.png",
        true,
        true,
        true,
        "PO#: 30019",
        "Packing: 20X50 CT"
      ],
      [
        " 16oz Paper Cup - Printed - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/-2777578630649795407.png",
        false,
        false,
        false,
        "PO#: 30010",
        "Packing: 20X50 CT",
        "Price \$0.00"
      ],
      [
        " pple 16oz Hot Paper Cups - 500ct/CS ",
        "assets/PaperCoffeeCupandLid/8512632283701271388.png",
        false,
        false,
        false,
        "PO#: 30017",
        "Packing: 20X25CT"
      ],
      [
        " 12 oz White Paper Cup - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/9129499862199864207.png",
        true,
        false,
        true,
        "PO#: 30004",
        "Packing: 20X50 CT",
        "Price \$58.63"
      ],
      [
        " 12oz Paper Cups - Printed - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/6534028848943984860.png",
        true,
        false,
        true,
        "PO#: 30009",
        "Packing: 20X50 CT",
        "Price \$65.74"
      ],
      [
        " White Dome  Lid for 4oz Paper Cup - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/-6518806071820155666.png",
        true,
        false,
        true,
        "PO#: 30018",
        "Packing: 20X50 CT",
        "Price \$27.69"
      ],
      [
        " 8oz White Paper Cup - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/-3887111517877199892.png",
        true,
        false,
        true,
        "PO#: 30002",
        "Packing: 20X50 CT",
        "Price \$47.17"
      ],
      [
        " White Flat Lid for 8 oz Cup - 1000ct/CS ",
        "assets/PaperCoffeeCupandLid/4123313158291754915.png",
        true,
        false,
        true,
        "PO#: 30021",
        "Packing: 20X50 CT",
        "Price \$30.03"
      ]
    ],
    "CategoryImage": [
      [
        "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Fcoffee.jpg?alt=media&token=5ea9da42-7e22-47b3-933f-cdd0f0b32a18",
        "Paper Coffee cup and Lid"
      ]
    ]
  },
  "Paper Soup cup": {
    "data": [
      [
        " 24 oz Paper Soup Container - Printed - 500ct/CS ",
        "assets/PaperSoupCupsandLid/-2879818427039569693.png",
        true,
        false,
        true,
        "PO#: 40009",
        "Packing: 20X25CT",
        "Price \$58.80"
      ],
      [
        " Plastic Lid for 8 oz Paper Soup Container - 1000ct/CS ",
        "assets/PaperSoupCupsandLid/9048935433622729636.png",
        true,
        false,
        true,
        "PO#: 40014",
        "Packing:20X50ct",
        "Price \$43.40"
      ],
      [
        " 8 oz Paper Soup Container - White - 1000ct/CS ",
        "assets/PaperSoupCupsandLid/-6595210785455372051.png",
        true,
        false,
        true,
        "PO#: 40001",
        "Packing:20X50CT",
        "Price \$68.49"
      ],
      [
        " Plastic Lid for 12 - 32 oz Paper Soup Container - 500ct/CS ",
        "assets/PaperSoupCupsandLid/5074271727679824436.png",
        true,
        false,
        true,
        "PO#: 40014",
        "Packing:20X25ct",
        "Price \$32.20"
      ],
      [
        " 16 oz Paper Soup Container - White - 500ct/CS ",
        "assets/PaperSoupCupsandLid/7390367085374610721.png",
        true,
        false,
        true,
        "PO#: 40003",
        "Packing:20X25ct",
        "Price \$51.80"
      ],
      [
        " 12 oz Paper Soup Container - Printed - 500ct/CS ",
        "assets/PaperSoupCupsandLid/1941649926967125938.png",
        true,
        false,
        true,
        "PO#: 40007",
        "Packing:20X25CT",
        "Price \$49.50"
      ],
      [
        " 12 oz Paper Soup Container - White - 500ct/CS ",
        "assets/PaperSoupCupsandLid/518355019384328911.png",
        true,
        false,
        true,
        "PO#40002",
        "Packing:20X25CT",
        "Price \$49.50"
      ],
      [
        " Plastic Lid for 4 oz Paper Soup Container ",
        "assets/PaperSoupCupsandLid/-8192734206076534844.png",
        false,
        false,
        false,
        "Plastic Lid for 4 oz Paper Soup Container",
        "Price \$0.00"
      ],
      [
        " 8 oz Paper Soup Container - Printed - 1000ct/CS ",
        "assets/PaperSoupCupsandLid/6383480510946553017.png",
        true,
        true,
        true,
        "PO#: 40006",
        "Packing:20X50CT",
        "Price \$69.99"
      ],
      [
        " 24 oz Paper Soup Container - White - 500ct/CS ",
        "assets/PaperSoupCupsandLid/8603218435935191542.png",
        true,
        true,
        true,
        "PO#40004",
        "Packing:20X25CT",
        "Price\$58.80"
      ],
      [
        " 16 oz Paper Soup Container - Printed - 500ct/CS ",
        "assets/PaperSoupCupsandLid/4144938716270818390.png",
        true,
        true,
        true,
        "PO#: 40008",
        "Packing:20X25CT",
        "Price \$51.80"
      ],
      [
        " 32 oz Paper Soup Container - White - 500ct/CS ",
        "assets/PaperSoupCupsandLid/-2802723693296484639.png",
        true,
        true,
        true,
        "PO#: 40005",
        "Packing:20X25CT",
        "Price \$68.60"
      ],
      [
        " 2 oz Paper Soup Container - Printed - 500ct/CS ",
        "",
        false,
        false,
        false,
        "PO#: 40010",
        "Packing: 20X25CT"
      ],
      [
        " 4 oz Paper Soup Container - White ",
        "assets/PaperSoupCupsandLid/7043751554551887658.png",
        false,
        false,
        false,
        "4 oz Paper Soup Container - White",
        "Price \$0.00"
      ]
    ],
    "CategoryImage": [
      ["", "Paper Soup cup and lid"]
    ]
  },
  "Plastic Bags": {
    "data": [
      [
        " Poly Bag - 1 lb - 500/Cs ",
        "",
        true,
        true,
        true,
        "Poly Bag - 1 lb - 500/Cs"
      ],
      [
        " Poly Bag - 7 lb - 500/Cs ",
        "assets/PlasticBag/4969809737321870627.png",
        true,
        true,
        true,
        "Poly Bag - 7 lb - 500/Cs"
      ],
      [
        " Poly Bag - 6 lb - 500/Cs ",
        "",
        true,
        true,
        true,
        "Poly Bag - 6 lb - 500/Cs"
      ],
      [
        "Garbage Bags - Ex - Strong - 42\" X 48\" - Black ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Ex - Strong - 42\" X 48\" - Black"
      ],
      [
        " Clear 11\"X17\" - Convenient Plastic Rolls - 6X800/Cs ",
        "",
        true,
        true,
        true,
        "Clear 11\"X17\" - Convenient Plastic Rolls - 6X800/Cs"
      ],
      [
        " Low Density T - Shirt Bag - White - S4 - 1000/Cs ",
        "",
        true,
        true,
        true,
        "Low Density T - Shirt Bag - White - S4 - 1000/Cs"
      ],
      [
        " Poly Bag - 2 lb - 500/Cs ",
        "assets/PlasticBag/4631767647430833882.png",
        true,
        true,
        true,
        "Poly Bag - 2 lb - 500/Cs"
      ],
      [
        "Garbage Bags - Ex - Strong - 42\" X 48\" - Clear ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Ex - Strong - 42\" X 48\" - Clear"
      ],
      [
        " 0.5\"X15.5\" -  Medium Produce Rolls ",
        "",
        true,
        true,
        true,
        "0.5\"X15.5\" - Medium Produce Rolls"
      ],
      [
        "Garbage Bags - Ex - Strong - 35\" X 47\" - Clear ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Ex - Strong - 35\" X 47\" - Clear"
      ],
      [
        " 2\"X20\" -  Produce Rolls - Extra Large ",
        "",
        true,
        true,
        true,
        "2\"X20\" -  Produce Rolls - Extra Large"
      ],
      [
        "Garbage Bags - Strong - 30\" X 38\" - Clear ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Strong - 30\" X 38\" - Clear"
      ],
      [
        " Low Density T - Shirt Bag - White - S3 - 1000/Cs ",
        "",
        true,
        true,
        true,
        "Low Density T - Shirt Bag - White - S3 - 1000/Cs"
      ],
      [
        " Low Density T - Shirt Bag - White - S2 - 2000/Cs ",
        "",
        true,
        true,
        true,
        "Low Density T - Shirt Bag - White - S2 - 2000/Cs"
      ],
      [
        " Poly Bag - 3 lb - 500/Cs ",
        "assets/PlasticBag/5400092262020302631.png",
        true,
        true,
        true,
        "Poly Bag - 3 lb - 500/Cs"
      ],
      [
        "Garbage Bags - Strong - 26\" X 36\" - Black ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Strong - 26\" X 36\" - Black"
      ],
      [
        "Garbage Bags - Strong - 26\" X 36\" - Clear ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Strong - 26\" X 36\" - Clear"
      ],
      [
        "Garbage Bags - Ex - Strong - 30\" X 38\" - Clear ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Ex - Strong - 30\" X 38\" - Clear"
      ],
      [
        " Poly Bag - 5 lb - 500/Cs ",
        "assets/PlasticBag/-6261716733143437626.png",
        true,
        true,
        true,
        "Poly Bag - 5 lb - 500/Cs"
      ],
      [
        " Poly Bag - 4 lb - 500/Cs ",
        "assets/PlasticBag/6527134580829947406.png",
        true,
        true,
        true,
        "Poly Bag - 4 lb - 500/Cs"
      ],
      [
        " Clear T - Shirt Rolls (8.25X5X19) - 6X600/Cs ",
        "assets/PlasticBag/-622309803226081206.png",
        true,
        true,
        true,
        "Clear T - Shirt Rolls (8.25X5X19) - 6X600/Cs"
      ],
      [
        " Poly Bag - 9 lb - 500/Cs ",
        "assets/PlasticBag/3477656146335664397.png",
        true,
        true,
        true,
        "Poly Bag - 9 lb - 500/Cs"
      ],
      [
        " 0.5\"X20\" -  Large Produce Rolls ",
        "",
        true,
        true,
        true,
        "0.5\"X15.5\" -  Large Produce Rolls"
      ],
      [
        "Garbage Bags - Strong - 35\" X 47 \"- Black ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Strong - 35\" X 47 \"- Black"
      ],
      [
        " Garbage Bags - Strong - 35\" X 47\" - Clear ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Strong - 35\" X 47\" - Clear"
      ],
      [
        "Garbage Bags - Strong - 30\" X 38\" - Black ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Strong - 30\" X 38\" - Black"
      ],
      [
        "Garbage Bags - Ragular - 24\" X 22\" - Clear ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Ragular - 24 \"X 22\" - Clear"
      ],
      [
        "Garbage Bags - Strong - 42\" X 48\" - Clear ",
        "assets/PlasticBag/4521788198660704861.png",
        true,
        true,
        true,
        "Garbage Bags - Strong - 42\" X 48\" - Clear"
      ],
      [
        " Low Density T - Shirt Bag - White - S5 - 1000/Cs ",
        "",
        true,
        true,
        true,
        "Low Density T - Shirt Bag - White - S5 - 1000/Cs"
      ],
      [
        "Garbage Bags - Ragular - 26\" X 36 \"- Clear ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Ragular - 26\" X 36 \"- Clear"
      ],
      [
        " Poly Bag - 8 lb - 500/Cs ",
        "assets/PlasticBag/-7886946845839138199.png",
        true,
        true,
        true,
        "Poly Bag - 8 lb - 500/Cs"
      ],
      [
        " Low Density T - Shirt Bag - White - S57- 500/Cs ",
        "",
        true,
        true,
        true,
        "Low Density T - Shirt Bag - White - S57- 500/Cs"
      ],
      [
        "Garbage Bags - Ex - Strong - 35\" X 47\" - Black ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Ex - Strong - 35\" X 47\" - Black"
      ],
      [
        " 14\"X20\" Produce Rolls - Extra Jumbo ",
        "",
        true,
        true,
        true,
        "14\"X20\" Produce Rolls - Extra Jumbo"
      ],
      [
        " Poly Bag - 11 lb - 500/Cs ",
        "assets/PlasticBag/5688525072795361113.png",
        true,
        true,
        true,
        "Poly Bag - 11 lb - 500/Cs"
      ],
      [
        "Garbage Bags - Strong - 42\" X 48\" - Black ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Strong - 42\" X 48\" - Black"
      ],
      [
        " Poly Bag - 0.5 lb - 500/Cs ",
        "",
        true,
        true,
        true,
        "Poly Bag - 0.5 lb - 500/Cs"
      ],
      [
        "Garbage Bags - Ex - Strong - 26\" X 36\" - Clear ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Ex - Strong - 26\" X 36\" - Clear"
      ],
      [
        " Low Density T - Shirt Bag - White - S1 - 2000/Cs ",
        "",
        true,
        true,
        true,
        "Low Density T - Shirt Bag - White - S1 - 2000/Cs"
      ],
      [
        " Poly Bag - 12 lb - 500/Cs ",
        "assets/PlasticBag/-2889527254735929606.png",
        true,
        true,
        true,
        "Poly Bag - 12 lb - 500/Cs"
      ],
      [
        "Garbage Bags - Ex - Strong - 26\" X 36\" - Black ",
        "",
        true,
        true,
        true,
        "Garbage Bags - Ex - Strong - 26\" X 36\" - Black"
      ],
      [
        " Poly Bag - 10 lb - 500/Cs ",
        "assets/PlasticBag/-3069903596779347768.png",
        true,
        true,
        true,
        "Poly Bag - 10 lb - 500/Cs"
      ]
    ],
    "CategoryImage": [
      ["", "Plastic Bags"]
    ]
  },
  "Bond or Thermal Paper Roll": {
    "data": [
      [
        "RR60 - 2.25\" 2.7\" (150') - Bond Paper - 50 ct/CS ",
        "",
        true,
        true,
        true,
        "PO# RR60",
        "Packing: 50ct/CS"
      ],
      [
        "RR72 - 2 1/4\" 55' Paper Rolls - Thermal - 100 ct/CS ",
        "assets/BondorThermalPaperRoll/8243204453815857561.png",
        true,
        true,
        true,
        "PO# RR72",
        "Packing: 100ct/CS"
      ],
      [
        "RR90 - 3 1/8\" 180' Paper Rolls - Thermal - 50 ct/CS ",
        "",
        true,
        true,
        true,
        "PO# RR90",
        "Packing: 50ct/CS"
      ],
      [
        "RR40 - 3\" x 3\" -  2 Ply Yellow/White  - Bond Paper  - 50 ct/CS ",
        "",
        true,
        true,
        true,
        "PO# RR40",
        "Packing: 50ct/CS"
      ],
      [
        "RR71 - 2 1/4\" 75' Paper Rolls - Thermal - 100 ct/CS ",
        "",
        true,
        true,
        true,
        "PO# RR71",
        "Pacing: 100ct/CS"
      ],
      [
        "RR30 - 3\" 3\"(150') - 1 ply - Bond Paper - 50 ct/CS ",
        "",
        true,
        true,
        true,
        "PO# RR30",
        "Packing: 50ct/CS"
      ],
      [
        "RR20 - 1 7/16\" 3\" - Bond Paper - 100ct/CS ",
        "assets/BondorThermalPaperRoll/-8858133851337729496.png",
        true,
        true,
        true,
        "PO# RR20",
        "Packing: 100ct/CS"
      ],
      [
        "RR10 - 1.75\" 3\" - Bond Paper - 100 ct/CS ",
        "",
        true,
        true,
        true,
        "PO#  RR10",
        "Packing: 100ct/CS"
      ],
      [
        "RR70 - 2 1/4\" 45'  Paper Rolls - Thermal - 100 ct/CS ",
        "",
        true,
        true,
        true,
        "PO# RR70",
        "Packing: 100 ct/CS"
      ],
      [
        "RR73 - 2 1/4\" 30' Paper Rolls - Thermal - 100 ct/CS ",
        "",
        true,
        true,
        true,
        "PO# RR73",
        "Packing: 100ct/CS"
      ],
      [
        "RR80 - 2.25\" 2.75\" Paper Rolls - Thermal - 50 ct/CS ",
        "",
        true,
        true,
        true,
        "PO# RR80",
        "Packing: 50ct/CS"
      ],
      [
        "RR74 - 2 1/4\" 30' Paper Rolls - Thermal - 50 ct/CS ",
        "",
        true,
        true,
        true,
        "PO# RR74",
        "Packing: 50ct/CS"
      ],
      [
        "RR50 - 3\" 3\" Thermal Rolls - 50 ct/CS ",
        "",
        true,
        true,
        true,
        "PO# RR50",
        "Packing: 50ct/CS"
      ]
    ],
    "CategoryImage": [
      ["", "Bond or Thermal Paper Roll"]
    ]
  },
  "Napkin": {
    "data": [
      [
        " Napkin  -  DN102 - 15\" X 16.5\"-1 Ply - 20 X 150ct ",
        "",
        true,
        true,
        true,
        "Napkin  -  DN102 - 15\" X 16.5\"-1 Ply - 20 X 150ct.",
        "PO#:: DN102"
      ],
      [
        " Napkin  -  DN401 - 9\" X 9\"-1 Ply - 8 X 500ct ",
        "",
        true,
        true,
        true,
        "Napkin  -  DN401 - 11\" X 11.4\"-1 Ply - 8 X 500ct",
        "PO#:: DN401"
      ],
      [
        " Napkin  -  DN101 - 7\" X 13.5\"-1 Ply - 20 X 450ct ",
        "",
        true,
        true,
        true,
        "Napkin  -  DN101 - 7\" X 13.5\"-1 Ply - 20 X 450ct.",
        "PO#:: DN101"
      ],
      [
        " Napkin  -  DN301 - 11\" X 11.4\"-1 Ply - 12 X 450ct ",
        "",
        true,
        true,
        true,
        "Napkin  -  DN301 - 11\" X 11.4\"-1 Ply - 12 X 450ct",
        "PO#:: DN301"
      ],
      [
        " Napkin  -  DN202 - High Quality - 15\" X 16.5\"-2 Ply  - 20 X 150ct ",
        "",
        true,
        true,
        true,
        "Napkin  -  DN202 - High Quality - 15\" X 16.5\"-2 Ply  - 20 X 150ct",
        "PO#:: DN202"
      ],
      [
        " Napkin  -  DN201 - 15\" X 16.5\"-2 Ply - 20 X 150ct ",
        "",
        true,
        true,
        true,
        "Napkin  -  DN201 - 15\" X 16.5\"-2 Ply - 20 X 150ct",
        "PO#:: DN201"
      ]
    ],
    "CategoryImage": [
      ["", "Napkin"]
    ]
  },
  "Plastic Portion cups": {
    "data": [
      [
        " Plastic Portion Cups - 4oz ",
        "assets/PlasticPortionCups/5900997769936160053.png",
        true,
        true,
        true,
        "PO# 80009"
      ],
      [
        " Lid for Plastic Portion Cups - 0.5oz/1oz ",
        "assets/PlasticPortionCups/1246712881998783149.png",
        true,
        true,
        true,
        "PO# 80010"
      ],
      [
        " Plastic Portion Cups - 0.5oz ",
        "assets/PlasticPortionCups/-587523794375723107.png",
        true,
        true,
        true,
        "PO# 80001"
      ],
      [
        " Plastic Portion Cups - 0.75oz ",
        "assets/PlasticPortionCups/-3484373478168624402.png",
        true,
        true,
        true,
        "PO# 80002"
      ],
      [
        " Plastic Portion Cups - 2oz - Black ",
        "",
        true,
        true,
        true,
        "Plastic Portion Cups - 2oz - Black"
      ],
      [
        " Plastic Portion Cups - 2.5oz ",
        "assets/PlasticPortionCups/4113997935533645608.png",
        true,
        true,
        true,
        "PO# 80007"
      ],
      [
        " Lid for Plastic Portion Cups - 3.25/4oz ",
        "assets/PlasticPortionCups/6864164283713699191.png",
        true,
        true,
        true,
        "PO# 80012"
      ],
      [
        " Plastic Portion Cups - 1oz ",
        "assets/PlasticPortionCups/-8694861303300993203.png",
        true,
        true,
        true,
        "PO# 80003"
      ],
      [
        " Plastic Portion Cups - 3.25oz ",
        "assets/PlasticPortionCups/-3375063255935120218.png",
        true,
        true,
        true,
        "PO# 80008"
      ],
      [
        " Plastic Portion Cups - 2oz ",
        "assets/PlasticPortionCups/-7684952520311844163.png",
        true,
        true,
        true,
        "PO# 80005"
      ],
      [
        " Plastic Portion Cups - 1.5oz ",
        "assets/PlasticPortionCups/1967517160198381660.png",
        true,
        true,
        true,
        "PO# 80004"
      ],
      [
        " Lid for Plastic Portion Cups - 1.5/2 oz ",
        "assets/PlasticPortionCups/-4955330323063573151.png",
        true,
        true,
        true,
        "PO# 80011"
      ]
    ],
    "CategoryImage": [
      ["", "Plastic Portion cups"]
    ]
  },
  "Wood Tableware": {
    "data": [
      [
        " od Spoon-20X100 ct ",
        "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Fwood-0.png?alt=media&token=f28da452-90d7-4b9c-8bed-fd301ddc3e98",
        true,
        true,
        true,
        "od Spoon-20X100 ct"
      ],
      [
        " od Knife-20X100 ct ",
        "assets/WoodTableware/-7800244617556071764.png",
        true,
        true,
        true,
        "od Knife-20X100 ct"
      ],
      [
        " od Fork 20X100 ct ",
        "assets/WoodTableware/4680064143321107524.png",
        true,
        true,
        true,
        "od Fork 20X100 ct"
      ]
    ],
    "CategoryImage": [
      ["", "Wood Tableware"]
    ]
  }
};
