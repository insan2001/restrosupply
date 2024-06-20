import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String name;
  const TitleWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        "    $name    ",
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.w700, color: Theme.of(context).primaryColor),
      ),
    );
  }
}
