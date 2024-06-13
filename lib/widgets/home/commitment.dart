import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class CommitImageWidget extends StatelessWidget {
  const CommitImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/goal.webp",
      width: MediaQuery.of(context).size.width >= mobileWidth
          ? MediaQuery.of(context).size.width / 2 <= 400
              ? MediaQuery.of(context).size.width / 2
              : 400
          : MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width >= mobileWidth
          ? MediaQuery.of(context).size.width / 2 <= 400
              ? MediaQuery.of(context).size.width / 2
              : 400
          : MediaQuery.of(context).size.width * 0.8,
      fit: BoxFit.cover,
    );
  }
}
