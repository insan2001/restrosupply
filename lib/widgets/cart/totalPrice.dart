import 'package:flutter/material.dart';

class BottomColumnWidget extends StatefulWidget {
  double totalPrice;
  BottomColumnWidget({super.key, required this.totalPrice});

  @override
  State<BottomColumnWidget> createState() => BottomColumnWidgetState();
}

class BottomColumnWidgetState extends State<BottomColumnWidget> {
  late double _totalPrice;
  @override
  void initState() {
    _totalPrice = widget.totalPrice;
    super.initState();
  }

  calculate(double oldPrice, double newPrice) {
    setState(() {
      _totalPrice -= oldPrice;
      _totalPrice += newPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(_totalPrice.toString()), Text("Checkout")],
    );
  }
}
