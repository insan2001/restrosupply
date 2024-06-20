import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/routeConstants.dart';

class LocationWidget extends StatefulWidget {
  final String category;
  const LocationWidget({super.key, required this.category});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  bool homeUnderLine = false;
  bool categoryUnderline = false;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: 'Home',
              onEnter: (event) => setState(() {
                    homeUnderLine = true;
                  }),
              onExit: (event) => setState(() {
                    homeUnderLine = false;
                  }),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  decoration: homeUnderLine ? TextDecoration.underline : null),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.go(RouteConstants().home);
                }),
          const TextSpan(
            text: "   >   ",
          ),
          TextSpan(
            text: widget.category,
            onEnter: (event) => setState(() {
              categoryUnderline = true;
            }),
            onExit: (event) => setState(() {
              categoryUnderline = false;
            }),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
                decoration:
                    categoryUnderline ? TextDecoration.underline : null),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                String? category = valueToID(widget.category);
                context.go("${RouteConstants().category}/$category");
              },
          ),
        ],
      ),
    );
  }
}
