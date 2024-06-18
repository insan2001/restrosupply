import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/screens/allProduct.dart';
import 'package:restrosupply/screens/homeScreen.dart';

class LocationWidget extends StatefulWidget {
  final String category;
  const LocationWidget({super.key, required this.category});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  bool underLine = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        underLine = true;
      }),
      onExit: (_) => setState(() {
        underLine = false;
      }),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.bold,
              decoration: underLine ? TextDecoration.underline : null),
          children: <TextSpan>[
            TextSpan(
                text: 'Home',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }),
            TextSpan(
              text: " > ",
            ),
            TextSpan(
              text: widget.category,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllProducts(
                                category: widget.category,
                              )));
                },
            ),
          ],
        ),
      ),
    );
  }
}
