import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/screens/allProduct.dart';
import 'package:restrosupply/screens/homeScreen.dart';

class LocationWidget extends StatelessWidget {
  final String category;
  const LocationWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.labelMedium,
        children: <TextSpan>[
          TextSpan(
              text: 'Home',
              style: Theme.of(context).textTheme.headlineLarge,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }),
          TextSpan(
            text: " > ",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          TextSpan(
            text: category,
            style: Theme.of(context).textTheme.headlineLarge,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllProducts(
                              category: category,
                            )));
              },
          ),
        ],
      ),
    );
  }
}
