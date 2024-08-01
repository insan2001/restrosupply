import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class DeliverySwitch extends StatefulWidget {
  final bool state;
  final String id;
  const DeliverySwitch({super.key, required this.state, required this.id});

  @override
  State<DeliverySwitch> createState() => _DeliverySwitchState();
}

class _DeliverySwitchState extends State<DeliverySwitch> {
  late bool state;
  @override
  void initState() {
    state = widget.state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Text("Delivery"),
          Switch(
              value: state,
              onChanged: (value) async {
                await FirebaseFirestore.instance
                    .collection(categoryProducts)
                    .doc(widget.id)
                    .update({shippings: value});
                setState(() {
                  state = value;
                });
              })
        ],
      ),
    );
  }
}
