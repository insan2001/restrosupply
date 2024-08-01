// import 'package:flutter/material.dart';
// import 'package:restrosupply/constants.dart';
// import 'package:restrosupply/data.dart';
// import 'package:restrosupply/functions/writeData.dart';

// class RemoveDataPopupWidget extends StatefulWidget {
//   const RemoveDataPopupWidget({super.key});

//   @override
//   RemoveDataPopupWidgetState createState() => RemoveDataPopupWidgetState();
// }

// class RemoveDataPopupWidgetState extends State<RemoveDataPopupWidget> {
//   final TextEditingController intController = TextEditingController();

//   late final List<String> _categories;
//   late String _selectedCategory;

//   @override
//   void initState() {
//     _categories = categoryId.values.toList();
//     _selectedCategory = _categories[0];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Enter Details'),
//       content: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             DropdownButtonFormField<String>(
//               value: _selectedCategory,
//               decoration: const InputDecoration(labelText: 'Category'),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedCategory = newValue ?? _selectedCategory;
//                 });
//               },
//               items: _categories.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             TextField(
//               controller: intController,
//               decoration: const InputDecoration(labelText: 'Enter the number'),
//             ),
//           ],
//         ),
//       ),
//       actions: <Widget>[
//         TextButton(
//           child: const Text('Cancel'),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         TextButton(
//           child: const Text('Remove'),
//           onPressed: () {
//             dataList[_selectedCategory]![data]!.removeAt(
//               int.parse(intController.text),
//             );
//             writeData(context);
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     intController.dispose();
//     super.dispose();
//   }
// }
