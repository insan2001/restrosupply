import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';

class InformationWidget extends StatefulWidget {
  // final List<dynamic> productData;
  final int index;
  final String category;
  const InformationWidget({
    super.key,
    required this.index,
    required this.category,
  });

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
  bool isEditTitle = false;
  bool isEditDescription = false;
  final TextEditingController title = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    title.text = dataList[widget.category]![data]![widget.index][textIndex];
    int flag = 0;
    String description = "";
    while (dataList[widget.category]![data]![widget.index].length -
            detailsIndex +
            flag -
            1 <
        (dataList[widget.category]![data]![widget.index].length -
            detailsIndex)) {
      description +=
          "${dataList[widget.category]![data]![widget.index][flag + detailsIndex]},";
      flag += 1;
    }
    descriptionController.text = description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width > mobileWidth
              ? MediaQuery.of(context).size.width * 0.5
              : MediaQuery.of(context).size.width * 0.8,
          child: GestureDetector(
            onTap: () {
              if (isAdmin) {
                setState(() {
                  isEditTitle = !isEditTitle;
                });
              }
            },
            child: isEditTitle
                ? TextField(
                    controller: title,
                    onSubmitted: (String value) {
                      dataList[widget.category]![data]![widget.index]
                          [textIndex] = title.text;
                      setState(() {
                        isEditTitle = !isEditTitle;
                      });
                      print("complete");
                    },
                  )
                : Text(
                    dataList[widget.category]![data]![widget.index][textIndex],
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            if (isAdmin) {
              setState(() {
                dataList[widget.category]![data]![widget.index][stockIndex] =
                    !dataList[widget.category]![data]![widget.index]
                        [stockIndex];
              });
            }
          },
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width <= mobileWidth
                      ? 20
                      : 0),
              Icon(
                dataList[widget.category]![data]![widget.index][stockIndex]
                    ? Icons.check
                    : Icons.close,
                color: dataList[widget.category]![data]![widget.index]
                        [stockIndex]
                    ? Colors.green
                    : Colors.red,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                dataList[widget.category]![data]![widget.index][stockIndex]
                    ? "In Stock"
                    : "Back order",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: dataList[widget.category]![data]![widget.index]
                              [stockIndex]
                          ? Colors.green
                          : Colors.red,
                    ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (isAdmin) {
              setState(() {
                dataList[widget.category]![data]![widget.index][pickupIndex] =
                    !dataList[widget.category]![data]![widget.index]
                        [pickupIndex];
              });
            }
          },
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width <= mobileWidth
                      ? 20
                      : 0),
              Icon(
                dataList[widget.category]![data]![widget.index][pickupIndex]
                    ? Icons.check
                    : Icons.close,
                color: dataList[widget.category]![data]![widget.index]
                        [pickupIndex]
                    ? Colors.green
                    : Colors.red,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Pickup - In store",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: dataList[widget.category]![data]![widget.index]
                              [pickupIndex]
                          ? Colors.green
                          : Colors.red,
                    ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (isAdmin) {
              setState(() {
                dataList[widget.category]![data]![widget.index][shippingIndex] =
                    !dataList[widget.category]![data]![widget.index]
                        [shippingIndex];
              });
            }
          },
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width <= mobileWidth
                      ? 20
                      : 0),
              Icon(
                dataList[widget.category]![data]![widget.index][shippingIndex]
                    ? Icons.check
                    : Icons.close,
                color: dataList[widget.category]![data]![widget.index]
                        [shippingIndex]
                    ? Colors.green
                    : Colors.red,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Shinpping",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: dataList[widget.category]![data]![widget.index]
                              [shippingIndex]
                          ? Colors.green
                          : Colors.red,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        isAdmin &&
                dataList[widget.category]![data]![widget.index][detailsIndex] ==
                    ""
            ? InkWell(
                onTap: () {
                  setState(() {
                    isEditDescription = true;
                  });
                },
                child: Container(
                  height: 100,
                  color: Colors.yellow,
                ))
            : SizedBox(),
        GestureDetector(
          onTap: () {
            setState(() {
              isEditDescription = true;
            });
          },
          child: isEditDescription
              ? SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width > mobileWidth
                      ? MediaQuery.of(context).size.width * 0.4
                      : MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    controller: descriptionController,
                    onSubmitted: (value) {
                      List<String> description = value.split(",");

                      dataList[widget.category]![data]![widget.index] = [
                        ...dataList[widget.category]![data]![widget.index]
                            .sublist(0, 5),
                        ...description
                      ];

                      setState(() {
                        print(dataList[widget.category]![data]![widget.index]);
                        isEditDescription = false;
                      });
                    },
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      dataList[widget.category]![data]![widget.index].length -
                          detailsIndex,
                      (index) => Row(
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width <=
                                          mobileWidth
                                      ? 20
                                      : 0),
                              Text(
                                dataList[widget.category]![data]![widget.index]
                                    [detailsIndex + index],
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          )),
                ),
        ),
      ],
    );
  }
}
