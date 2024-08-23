import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class DetailEditor extends StatefulWidget {
  final String title;
  final double? price;
  final String? content;
  final String path;
  final TextEditingController controller;
  const DetailEditor(
      {super.key,
      required this.title,
      required this.content,
      required this.controller,
      required this.path,
      this.price});

  @override
  State<DetailEditor> createState() => _DetailEditorState();
}

class _DetailEditorState extends State<DetailEditor> {
  late TextEditingController editor;
  bool edit = true;

  @override
  void initState() {
    editor = widget.controller;
    editor.text = widget.content == null
        ? widget.price.toString()
        : widget.content.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: editor,
          readOnly: !edit,
          decoration: InputDecoration(
            labelText: widget.title,
            prefixIcon: widget.title == qty ||
                    widget.title == prices ||
                    widget.title == pieces
                ? Icon(Icons.looks_one_outlined)
                : Icon(Icons.abc),
            suffixIcon: IconButton(
              onPressed: () async {
                if (edit) {
                  dynamic updatable = "";
                  if (widget.title == qty ||
                      widget.title == prices ||
                      widget.title == pieces) {
                    try {
                      updatable =
                          (widget.title == qty || widget.title == pieces)
                              ? int.parse(editor.text)
                              : double.parse(editor.text);
                    } catch (_) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Container(
                              color: Colors.red,
                              child:
                                  Text("${widget.title} must be a number."))));
                      return;
                    }
                  } else {
                    updatable = editor.text;
                  }
                  try {
                    await FirebaseFirestore.instance
                        .collection(categoryProducts)
                        .doc(widget.path)
                        .update({widget.title: updatable});
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Container(
                            color: Colors.green,
                            child: Text("${widget.title} has been updated."))));
                  } catch (e) {}
                }
                setState(() {
                  edit = !edit;
                });
              },
              icon: Icon(edit ? Icons.save : Icons.edit),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: edit ? Colors.red : Theme.of(context).primaryColor,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: edit ? Colors.red : Theme.of(context).primaryColor,
                width: 2.0,
              ),
            ),
            filled: true,
            // fillColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
