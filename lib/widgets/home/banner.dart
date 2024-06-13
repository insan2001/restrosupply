import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/screens/allProduct.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/bg.png",
            fit: BoxFit.cover,
            height: mobileWidth,
            width: MediaQuery.of(context).size.width,
          ),
          Align(
            alignment: Alignment(-0.75, 0),
            child: SizedBox(
              height: 450,
              child: Wrap(children: [
                Padding(
                  padding: MediaQuery.of(context).size.width > mobileWidth
                      ? EdgeInsets.all(0)
                      : EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width >= mobileWidth
                            ? MediaQuery.of(context).size.width * 0.5
                            : MediaQuery.of(context).size.width,
                        child: Text(
                          "Provide complete tableware solutions for the catering industry",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        splashColor: null,
                        highlightColor: null,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AllProducts(category: all))),
                        child: Container(
                          width: 180,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "All categories",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
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
