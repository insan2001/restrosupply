import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class PickupSwitch extends StatefulWidget {
  final bool state;
  final String id;
  const PickupSwitch({super.key, required this.state, required this.id});

  @override
  State<PickupSwitch> createState() => _PickupSwitchState();
}

class _PickupSwitchState extends State<PickupSwitch> {
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
          Text("Pick up"),
          Switch(
              value: state,
              onChanged: (value) async {
                await FirebaseFirestore.instance
                    .collection(categoryProducts)
                    .doc(widget.id)
                    .update({pickups: value});
                setState(() {
                  state = value;
                });
              })
        ],
      ),
    );
  }
}
