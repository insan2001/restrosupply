import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/widgets/body/customImage.dart';

class AddCategoryPopup extends StatefulWidget {
  const AddCategoryPopup({super.key});

  @override
  _AddCategoryPopupState createState() => _AddCategoryPopupState();
}

class _AddCategoryPopupState extends State<AddCategoryPopup> {
  final controller = TextEditingController();
  String img = emptyImage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Category'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                CustomImageWidget(path: img),
                Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                        onPressed: () async {}, icon: Icon(Icons.edit)))
              ],
            ),
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Category Name'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (controller.text == "" ||
                controller.text.contains("/") ||
                controller.text.contains("#")) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      "Category name can't be empy or can't contain '/' or '#'")));
              return;
            }
            FirebaseFirestore.instance
                .collection(category)
                .doc(categoryName)
                .collection(categoryName)
                .add({categoryName: controller.text, categoryImage: img}).then(
                    (value) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      "Category : '${controller.text}' has been created.")));
              Navigator.pop(context);
            });
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
