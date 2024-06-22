import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/productData.dart';

class InformationWidget extends StatefulWidget {
  final List<dynamic> productData;
  const InformationWidget({super.key, required this.productData});

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
    title.text = widget.productData[textIndex];
    int flag = 0;
    String description = "";
    while (widget.productData.length - detailsIndex + flag - 1 <
        (widget.productData.length - detailsIndex)) {
      description += "${widget.productData[flag + detailsIndex]},";
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
                      widget.productData[textIndex] = title.text;
                      setState(() {
                        isEditTitle = !isEditTitle;
                      });
                      print("complete");
                    },
                  )
                : Text(
                    widget.productData[textIndex],
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            if (isAdmin) {
              setState(() {
                widget.productData[stockIndex] =
                    !widget.productData[stockIndex];
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
                widget.productData[stockIndex] ? Icons.check : Icons.close,
                color:
                    widget.productData[stockIndex] ? Colors.green : Colors.red,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.productData[stockIndex] ? "In Stock" : "Out of stock",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: widget.productData[stockIndex]
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
                widget.productData[pickupIndex] =
                    !widget.productData[pickupIndex];
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
                widget.productData[pickupIndex] ? Icons.check : Icons.close,
                color:
                    widget.productData[pickupIndex] ? Colors.green : Colors.red,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Pickup - In store",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: widget.productData[pickupIndex]
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
                widget.productData[shippingIndex] =
                    !widget.productData[shippingIndex];
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
                widget.productData[shippingIndex] ? Icons.check : Icons.close,
                color: widget.productData[shippingIndex]
                    ? Colors.green
                    : Colors.red,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Shinpping",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: widget.productData[shippingIndex]
                          ? Colors.green
                          : Colors.red,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
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
                      int flag = 0;
                      print(value);
                      List<String> description = value.split(",");
                      print(description);
                      while (
                          widget.productData.length - detailsIndex + flag - 1 <=
                              (widget.productData.length - detailsIndex)) {
                        print(description[flag]);
                        widget.productData
                            .insert((flag + detailsIndex), description[flag]);
                        flag += 1;
                      }

                      setState(() {
                        print(widget.productData);
                        isEditDescription = false;
                      });
                    },
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      widget.productData.length - detailsIndex,
                      (index) => Row(
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width <=
                                          mobileWidth
                                      ? 20
                                      : 0),
                              Text(
                                widget.productData[detailsIndex + index],
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
