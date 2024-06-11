import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/widgets/body/producs.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<String> keys;

  @override
  void initState() {
    keys = dataList.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: mobileWidth,
            child: Stack(
              children: [
                Image.network(
                  "https://fastly.picsum.photos/id/371/200/170.jpg?hmac=wdhdDfYq7-5mdVfZCplHul6PBaxFrpPNkPwllJz93gA",
                  fit: BoxFit.cover,
                  height: mobileWidth,
                  width: MediaQuery.of(context).size.width,
                ),
                Align(
                  alignment: Alignment(-0.75, 0),
                  child: SizedBox(
                    height: 450,
                    child: Wrap(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width >= mobileWidth
                                    ? MediaQuery.of(context).size.width * 0.5
                                    : MediaQuery.of(context).size.width,
                            child: Text(
                              "Provide complete tableware solutions for the catering industry",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            child: Container(
                              width: 180,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "All categories",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Shop By Category",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 10,
              ),
              MediaQuery.of(context).size.width >= mobileWidth
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        6,
                        (index) => ProductsInfo(keys: keys, index: index),
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        6,
                        (index) => ProductsInfo(keys: keys, index: index),
                      ),
                    ),
            ],
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: MediaQuery.of(context).size.width >= mobileWidth
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Placeholder(), Placeholder(), Placeholder()],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Placeholder(), Placeholder(), Placeholder()],
                  ),
          ),
          MediaQuery.of(context).size.width >= mobileWidth
              ? Container(
                  height: ((mobileWidth * 0.5) + 20) * 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      5,
                      (index) => Container(
                        height: mobileWidth * 0.5,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          children: [
                            SizedBox(
                              width: mobileWidth * 0.5,
                              child: Column(
                                children: [
                                  Text(
                                    keys[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                  Stack(
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          width: 300,
                                          height: 300,
                                          child: Image.network(
                                            dataList[keys[index]]![catImage]![0]
                                                [0],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            width: 150,
                                            height: 50,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                              child: Text(
                                                "View More",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: (MediaQuery.of(context).size.width * 0.8) -
                                  (mobileWidth * 0.5),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    dataList[keys[index]]![data]!.length,
                                    (_index) => Container(
                                      width:
                                          MediaQuery.of(context).size.width / 8,
                                      padding: EdgeInsets.only(
                                          right: 10, left: 10, top: 15),
                                      height: 250,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                8,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                8,
                                            child: Image.network(
                                              dataList[keys[index]]![data]![
                                                  _index][imageIndex],
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            dataList[keys[index]]![data]![
                                                _index][textIndex],
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                            maxLines: 3,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: 20,
                ),
          isDevice(
            desktop: Row(
              children: [
                Spacer(),
                Image.network(
                  "https://fastly.picsum.photos/id/459/200/300.jpg?hmac=4Cn5sZqOdpuzOwSTs65XA75xvN-quC4t9rfYYyoTCEI",
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
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width >= mobileWidth
                      ? MediaQuery.of(context).size.width * 0.03
                      : 0,
                  height:
                      MediaQuery.of(context).size.width >= mobileWidth ? 20 : 0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our Commitment",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        """At Golden Maple Plastic & Paper Inc., we are dedicated to providing environmentally friendly, non-toxic, and high-quality products to meet the needs of Canada's food industry. We take pride in our contributions to environmental sustainability, hygiene, and safety. We are a company committed to a green economy and social responsibility. If you have any inquiries or need information about our products and services, please feel free to contact us. We look forward to serving you and making a positive impact on Canada's food industry.""",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                        softWrap: true,
                      ),
                    ),
                    Container(
                      width: 180,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Contact Us",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
            mobile: Column(
              children: [
                Image.network(
                  "https://fastly.picsum.photos/id/459/200/300.jpg?hmac=4Cn5sZqOdpuzOwSTs65XA75xvN-quC4t9rfYYyoTCEI",
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
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width >= mobileWidth
                      ? MediaQuery.of(context).size.width * 0.03
                      : 0,
                  height:
                      MediaQuery.of(context).size.width >= mobileWidth ? 20 : 0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our Commitment",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        """At Golden Maple Plastic & Paper Inc., we are dedicated to providing environmentally friendly, non-toxic, and high-quality products to meet the needs of Canada's food industry. We take pride in our contributions to environmental sustainability, hygiene, and safety. We are a company committed to a green economy and social responsibility. If you have any inquiries or need information about our products and services, please feel free to contact us. We look forward to serving you and making a positive impact on Canada's food industry.""",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                        softWrap: true,
                      ),
                    ),
                    Container(
                      width: 180,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Contact Us",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 240,
            color: Colors.black54,
          )
        ],
      ),
    );
  }
}
