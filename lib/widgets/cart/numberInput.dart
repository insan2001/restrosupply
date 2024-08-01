import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputField extends StatefulWidget {
  final double price;
  final int initial;
  const NumberInputField(
      {super.key, required this.price, required this.initial});
  @override
  NumberInputFieldState createState() => NumberInputFieldState();
}

class NumberInputFieldState extends State<NumberInputField> {
  TextEditingController _controller = TextEditingController();
  late String total;

  @override
  void initState() {
    _controller.text = widget.initial.toString();
    total = (widget.price * widget.initial).toStringAsFixed(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 60,
              color: Colors.green,
              child: Center(
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  cursorHeight: 20,
                  onChanged: (value) {
                    double totalPrice = (widget.price *
                        int.parse(
                            _controller.text == "" ? "0" : _controller.text));
                    setState(() {
                      total = totalPrice.toStringAsFixed(2);
                    });
                  },
                  textAlignVertical: TextAlignVertical.top,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Text(" = \$ $total"),
          ],
        ),
      ),
    );
  }
}
