import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/body/customImage.dart';
import 'package:restrosupply/widgets/customBtn.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        children: [
          CustomImageWidget(
            path: "assets/images/bg.jpg",
            height: mobileWidth,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: const Alignment(-0.75, 0),
            child: SizedBox(
              height: 450,
              child: Wrap(children: [
                Padding(
                  padding: MediaQuery.of(context).size.width > mobileWidth
                      ? const EdgeInsets.all(0)
                      : const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width >= mobileWidth
                            ? MediaQuery.of(context).size.width * 0.5
                            : MediaQuery.of(context).size.width,
                        child: Text(
                          "Elevate your catering with our all-inclusive tableware solutions!",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 180,
                        child: CustomButtonWidget(
                            navPath: "${RouteConstants().category}/$all",
                            text: all),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
