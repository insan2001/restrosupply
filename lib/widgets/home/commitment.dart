import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/widgets/body/customImage.dart';

class CommitImageWidget extends StatelessWidget {
  const CommitImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomImageWidget(
      path: "assets/images/commitment.jpg",
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
    );
  }
}
