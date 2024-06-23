import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/functions/writeData.dart';

class AddDataPopupWidget extends StatefulWidget {
  @override
  AddDataPopupWidgetState createState() => AddDataPopupWidgetState();
}

class AddDataPopupWidgetState extends State<AddDataPopupWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  bool _shipping = false;
  bool _instore = false;
  bool _instock = false;

  late final List<String> _categories;
  late String _selectedCategory;

  @override
  void initState() {
    _categories = categoryId.values.toList();
    _selectedCategory = _categories[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Details'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Dropdown for category selection
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(labelText: 'Category'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue ?? _selectedCategory;
                });
              },
              items: _categories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Product name'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            CheckboxListTile(
              title: Text('Shipping'),
              value: _shipping,
              onChanged: (bool? value) {
                setState(() {
                  _shipping = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('In-store'),
              value: _instore,
              onChanged: (bool? value) {
                setState(() {
                  _instore = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('In-stock'),
              value: _instock,
              onChanged: (bool? value) {
                setState(() {
                  _instock = value ?? false;
                });
              },
            ),
            TextField(
              controller: _detailsController,
              decoration: InputDecoration(labelText: 'Details'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Add'),
          onPressed: () {
            // Handle form submission
            String title = _titleController.text;
            String imageUrl = _imageUrlController.text;
            String details = _detailsController.text;
            bool shipping = _shipping;
            bool instore = _instore;
            bool instock = _instock;
            String category = _selectedCategory;
            List<dynamic> newData = [
              title,
              imageUrl,
              instock,
              instore,
              shipping,
              ...details.split(",")
            ];

            dataList[category]![data]!.add(newData);
            writeData(context);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _imageUrlController.dispose();
    _detailsController.dispose();
    super.dispose();
  }
}
