// import 'package:flutter/material.dart';
// import 'package:restrosupply/data.dart';
// import 'package:restrosupply/functions/categoryUpload.dart';

// class RemoveCategoryPopup extends StatefulWidget {
//   const RemoveCategoryPopup({super.key});

//   @override
//   State<RemoveCategoryPopup> createState() => _RemoveCategoryPopupState();
// }

// class _RemoveCategoryPopupState extends State<RemoveCategoryPopup> {
//   final TextEditingController controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: TextField(
//         controller: controller,
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: const Text('Cancel'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             String value;
//             value = controller.text;
//             if (categoryId.keys.toList().contains(value)) {
//               dataList.remove(categoryId[value]);
//               categoryId.remove(value);
//               writeCategory(context);

//               Navigator.pop(context);
//               setState(() {});
//             } else {
//               setState(() {
//                 controller.text = "wrong key";
//               });
//             }
//           },
//           child: const Text('Submit'),
//         ),
//       ],
//     );
//   }
// }
