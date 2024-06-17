import 'package:flutter/material.dart';

class SuggestTextWidget extends StatelessWidget {
  const SuggestTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "You might also like these",
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}
