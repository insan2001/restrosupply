import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/screens/allProduct.dart';
import 'package:restrosupply/screens/homeScreen.dart';

class LocationWidget extends StatelessWidget {
  final String category;
  const LocationWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: MediaQuery.of(context).size.width > mobileWidth
            ? Theme.of(context).textTheme.headlineLarge
            : Theme.of(context).textTheme.headlineMedium,
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
            text: category,
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
