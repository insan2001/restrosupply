import 'package:flutter/material.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/customBtn.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "The page you are looking for doesn't exist.",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          CustomButtonWidget(navPath: RouteConstants().home, text: "Home")
        ],
      ),
    );
  }
}
