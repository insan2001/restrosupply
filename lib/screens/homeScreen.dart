import 'package:flutter/material.dart';

const String data = "data";
const String catImage = "CategoryImage";

final Map<String, Map<String, List<dynamic>>> dataList = {
  "Product Category1": {
    data: [
      [
        "Product Name1",
        0,
        "https://fastly.picsum.photos/id/237/400/400.jpg?hmac=xOOBt-lNJA0YjxEj0QoS_0PZV5iI3oxZA_weJ4E1xEw",
        "PO#: 20042",
        "Anothr detail"
      ],
      [
        "Product Name2",
        0,
        "https://fastly.picsum.photos/id/474/200/200.jpg?hmac=X5gJb746aYb_1-VdQG2Cti4XcHC10gwaOfRGfs6fTNk",
        "PO#: 20042",
        "Anothr detail"
      ],
      ["Product Name3", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name4", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name5", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name6", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name7", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name8", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
    ],
    catImage: [
      "https://fastly.picsum.photos/id/1006/200/200.jpg?hmac=yv53p45TOMz8bY4ZXUVRMFMO0_6d5vGuoWtE2hJhxlc"
    ],
  },
  "Product Category2": {
    data: [
      ["Product Name!", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      [
        "Product Name2",
        0,
        "https://fastly.picsum.photos/id/237/400/400.jpg?hmac=xOOBt-lNJA0YjxEj0QoS_0PZV5iI3oxZA_weJ4E1xEw",
        "PO#: 20042",
        "Anothr detail"
      ],
      ["Product Name3", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name4", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name5", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name6", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name7", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name8", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
    ],
    catImage: ["CatergoryImageUrl"],
  },
  "Product Category3": {
    data: [
      ["Product Name!", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name2", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name3", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name4", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name5", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name6", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name7", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name8", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
    ],
    catImage: ["CatergoryImageUrl"],
  },
  "Product Category4": {
    data: [
      ["Product Name!", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name2", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name3", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name4", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name5", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name6", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name7", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name8", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
    ],
    catImage: ["CatergoryImageUrl"],
  },
  "Product Category5": {
    data: [
      ["Product Name!", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name2", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name3", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name4", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name5", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name6", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name7", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name8", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
    ],
    catImage: ["CatergoryImageUrl"],
  },
  "Product Category6": {
    data: [
      ["Product Name!", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name2", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name3", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name4", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name5", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name6", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name7", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
      ["Product Name8", 0, "ImageUrl", "PO#: 20042", "Anothr detail"],
    ],
    catImage: ["CatergoryImageUrl"],
  },
};

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> keys = dataList.keys.toList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Stack(
              children: [
                Image.network(
                  "https://fastly.picsum.photos/id/371/200/170.jpg?hmac=wdhdDfYq7-5mdVfZCplHul6PBaxFrpPNkPwllJz93gA",
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height * 0.85,
                  width: MediaQuery.of(context).size.width,
                ),
                Align(
                  alignment: Alignment(-0.75, 0),
                  child: SizedBox(
                    height: (MediaQuery.of(context).size.width /
                                MediaQuery.of(context).size.height) >
                            1.3
                        ? MediaQuery.of(context).size.height * 0.5
                        : MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width > 480
                                ? MediaQuery.of(context).size.width * 0.5
                                : MediaQuery.of(context).size.width,
                            child: Text(
                              "Provide complete tableware solutions for the catering industry",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ]),
                        Container(
                          width: 180,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "All categories",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.amber,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Shop By Category",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    6,
                    (index) => Container(
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.width / 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width / 8,
                            color: Colors.red,
                            child: Image.network(
                              dataList[keys[index]]![catImage]![0],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            keys[index],
                            style: Theme.of(context).textTheme.labelMedium,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.orange,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Placeholder(), Placeholder(), Placeholder()],
            ),
          ),
          Container(
            color: Colors.grey,
            height: ((MediaQuery.of(context).size.height * 0.5) + 20) * 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                (index) => Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          children: [
                            Text(
                              keys[index],
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Stack(
                              children: [
                                Center(
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: Image.network(
                                      dataList[keys[index]]![catImage]![0],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width: 150,
                                      height: 40,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Text(
                                          "View More",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
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
                        width: MediaQuery.of(context).size.width * 0.8 -
                            MediaQuery.of(context).size.height * 0.5,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                dataList[keys[index]]![data]!.length,
                                (_index) => Container(
                                      margin: EdgeInsets.all(20),
                                      width:
                                          ((MediaQuery.of(context).size.width *
                                                      0.8 -
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.5) /
                                              3),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      color: Colors.amber,
                                      child: Column(
                                        children: [
                                          Spacer(),
                                          Center(
                                            child: Image.network(
                                              dataList[keys[index]]![data]![
                                                  _index][2],
                                              width: ((MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.8 -
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.5) /
                                                  3),
                                              fit: BoxFit.fill,
                                              height: ((MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.8 -
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.5) /
                                                  3),
                                            ),
                                          ),
                                          Spacer(),
                                          Center(
                                            child: Text(
                                              dataList[keys[index]]![data]![
                                                  _index][0],
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            color: Colors.amber,
            child: Row(
              children: [
                Placeholder(
                  fallbackWidth: MediaQuery.of(context).size.width / 2,
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
