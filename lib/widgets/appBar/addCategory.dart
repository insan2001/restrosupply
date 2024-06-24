import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

import 'package:restrosupply/data.dart';
import 'package:restrosupply/functions/categoryUpload.dart';

class AddCategoryPopup extends StatefulWidget {
  @override
  _AddCategoryPopupState createState() => _AddCategoryPopupState();
}

class _AddCategoryPopupState extends State<AddCategoryPopup> {
  final _formKey = GlobalKey<FormState>();
  String? categoryName;
  String? fullName;
  String? shortName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Category'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Category Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category name';
                  }
                  return null;
                },
                onSaved: (value) {
                  categoryName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a full name';
                  }
                  return null;
                },
                onSaved: (value) {
                  fullName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Short Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a short name';
                  } else if (categoryId.keys.toList().contains(value)) {
                    return 'Name already exists';
                  }
                  return null;
                },
                onSaved: (value) {
                  shortName = value;
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              Map<String, List<List<dynamic>>> newCategory = {
                data: [],
                catImage: [
                  ["", fullName]
                ]
              };
              dataList[categoryName!] = newCategory;
              categoryId[shortName!] = categoryName!;
              writeCategory(context);
              Navigator.of(context).pop();
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
