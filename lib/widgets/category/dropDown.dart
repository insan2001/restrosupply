import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';

class CustomDropDownWidget extends StatefulWidget {
  final String id;
  const CustomDropDownWidget({super.key, required this.id});

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  late String selected;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection(category).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return WaitingWidget();
          } else if (snapshot.hasError) {
            return LoadingErrorWidget();
          } else {
            List<String> categories =
                snapshot.data!.docs.map((QueryDocumentSnapshot value) {
              return value.id;
            }).toList();
            selected = widget.id;
            categories.insert(0, all);
            return Row(
              children: [
                const Spacer(flex: 1),
                DropdownButton<String>(
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                  hint: Text(
                    selected,
                    style: const TextStyle(color: Colors.black),
                  ),
                  items: categories.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (item) {
                    context.go("${RouteConstants().category}/$item");
                  },
                ),
                const Spacer(flex: 3),
              ],
            );
          }
        });
  }
}
