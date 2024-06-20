import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomButtonWidget extends StatelessWidget {
  final String navPath;
  final String text;
  const CustomButtonWidget(
      {super.key, required this.navPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: null,
      highlightColor: null,
      onTap: () => context.go(navPath),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
