import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/screens/contactUs.dart';

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
          style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width > mobileWidth
              ? MediaQuery.of(context).size.width * 0.3
              : MediaQuery.of(context).size.width * 0.8,
          child: Text(
            """At Golden Maple Plastic & Paper Inc., we are dedicated to providing environmentally friendly, non-toxic, and high-quality products to meet the needs of Canada's food industry. We take pride in our contributions to environmental sustainability, hygiene, and safety. We are a company committed to a green economy and social responsibility. If you have any inquiries or need information about our products and services, please feel free to contact us. We look forward to serving you and making a positive impact on Canada's food industry.""",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black),
            softWrap: true,
          ),
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactUsScreen(),
            ),
          ),
          child: Container(
            width: 180,
            padding: EdgeInsets.all(10),
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
