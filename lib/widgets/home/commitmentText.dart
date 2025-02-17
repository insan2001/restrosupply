import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/routeConstants.dart';

class CommitTextWidget extends StatelessWidget {
  const CommitTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: MediaQuery.of(context).size.width > mobileWidth
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          "Our Commitment",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Theme.of(context).primaryColor),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width > mobileWidth
              ? MediaQuery.of(context).size.width * 0.25
              : MediaQuery.of(context).size.width * 0.8,
          child: Text(
            """At Restro supply hub, we are dedicated to providing environmentally friendly, non-toxic, and high-quality products to meet the needs of Canada's food industry. We take pride in our contributions to environmental sustainability, hygiene, and safety. We are a company committed to a green economy and social responsibility. If you have any inquiries or need information about our products and services, please feel free to contact us. We look forward to serving you and making a positive impact on Canada's food industry.""",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black),
            softWrap: true,
          ),
        ),
        InkWell(
          onTap: () => context.go(RouteConstants().contactUs),
          child: Container(
            width: 180,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                "Contact Us",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
      ],
    );
  }
}
