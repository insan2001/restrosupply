import 'package:flutter/material.dart';

class WaitingWidget extends StatelessWidget {
  const WaitingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
