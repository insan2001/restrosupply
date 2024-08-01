import 'package:flutter/material.dart';

class TwoTextField extends StatefulWidget {
  final int index;
  final String valueKey;
  final String value;
  final Function saveFunction;
  const TwoTextField(
      {super.key,
      required this.index,
      required this.valueKey,
      required this.value,
      required this.saveFunction});

  @override
  State<TwoTextField> createState() => _TwoTextFieldState();
}

class _TwoTextFieldState extends State<TwoTextField> {
  bool edit = false;
  TextEditingController valueEditor = TextEditingController();

  @override
  void initState() {
    valueEditor.text = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            widget.valueKey,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 2, color: edit ? Colors.red : Colors.blue),
            ),
            width: MediaQuery.of(context).size.width * 0.3,
            child: TextField(
              controller: valueEditor,
              readOnly: !edit,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          IconButton(
            onPressed: () => setState(() {
              edit = !edit;
            }),
            icon: Icon(edit ? Icons.save : Icons.edit),
          ),
        ],
      ),
    );
  }
}
