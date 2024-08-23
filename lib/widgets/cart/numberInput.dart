import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/cartProvider.dart';
import 'package:restrosupply/modules/userProvider.dart';

class NumberInputField extends StatefulWidget {
  final double price;
  final int initial;
  final String id;
  const NumberInputField({
    super.key,
    required this.price,
    required this.initial,
    required this.id,
  });
  @override
  NumberInputFieldState createState() => NumberInputFieldState();
}

class NumberInputFieldState extends State<NumberInputField> {
  TextEditingController _controller = TextEditingController();
  late String total;
  late int oldQuantity;
  bool init = false;

  @override
  void initState() {
    _controller.text = widget.initial.toString();
    oldQuantity = widget.initial;
    double totalPrice = (widget.price * oldQuantity);
    total = totalPrice.toStringAsFixed(2);
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
                  onChanged: (value) async {
                    int newQuantity = int.parse(
                        _controller.text == "" ? "0" : _controller.text);
                    double totalPrice = widget.price * newQuantity;
                    context
                        .read<Cartprovider>()
                        .addProduct(widget.id, totalPrice, newQuantity);
                    final firestore = FirebaseFirestore.instance;
                    final cartRef = firestore
                        .collection(users)
                        .doc(context.read<UserProvider>().uid!);
                    final cartSnapshot = await cartRef.get();
                    final currentCart =
                        cartSnapshot.data()?[cart] as Map<String, dynamic>? ??
                            {};
                    currentCart[widget.id] = newQuantity;
                    cartRef.update({cart: currentCart});
                    oldQuantity = newQuantity;
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
