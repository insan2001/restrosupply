import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/modules/product.dart';

class InformationWidget extends StatefulWidget {
  final Product product;
  const InformationWidget({
    super.key,
    required this.product,
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
  // void initState() {
  //   title.text = dataList[widget.category]![data]![widget.index][textIndex];
  //   descriptionController.text = dataList[widget.category]![data]![widget.index]
  //       .sublist(detailsIndex)
  //       .join(", ");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width > mobileWidth
              ? MediaQuery.of(context).size.width * 0.5
              : MediaQuery.of(context).size.width,
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
                      // dataList[widget.category]![data]![widget.index]
                      //     [textIndex] = title.text;
                      // setState(() {
                      //   isEditTitle = !isEditTitle;
                      // });
                    },
                  )
                : Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width > mobileWidth
                            ? 0
                            : MediaQuery.of(context).size.width * 0.05),
                    child: Text(
                      widget.product.title,
                      style: MediaQuery.of(context).size.width > mobileWidth
                          ? Theme.of(context).textTheme.headlineMedium
                          : Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.product.price == null
              ? "N/A"
              : "\$ ${widget.product.price.toString()}",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Theme.of(context).primaryColor),
        ),

        const SizedBox(height: 10),
        widget.product.details != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(widget.product.details!.length,
                    (index) => Text(widget.product.details![index])),
              )
            : SizedBox(),

        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            // if (isAdmin) {
            //   setState(() {
            //     dataList[widget.category]![data]![widget.index][stockIndex] =
            //         !dataList[widget.category]![data]![widget.index]
            //             [stockIndex];
            //   });
            // }
          },
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width <= mobileWidth
                      ? 20
                      : 0),
              Icon(
                widget.product.stock ? Icons.check : Icons.close,
                color: widget.product.stock ? Colors.green : Colors.red,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.product.stock ? "In Stock" : "Back order",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: widget.product.stock ? Colors.green : Colors.red,
                    ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            // if (isAdmin) {
            //   setState(() {
            //     dataList[widget.category]![data]![widget.index][pickupIndex] =
            //         !dataList[widget.category]![data]![widget.index]
            //             [pickupIndex];
            //   });
            // }
          },
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width <= mobileWidth
                      ? 20
                      : 0),
              Icon(
                widget.product.pickup ? Icons.check : Icons.close,
                color: widget.product.pickup ? Colors.green : Colors.red,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Pickup - In store",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: widget.product.pickup ? Colors.green : Colors.red,
                    ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width <= mobileWidth
                      ? 20
                      : 0),
              Icon(
                widget.product.shipping ? Icons.check : Icons.close,
                color: widget.product.shipping ? Colors.green : Colors.red,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Shinpping",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color:
                          widget.product.shipping ? Colors.green : Colors.red,
                    ),
              ),
            ],
          ),
        ),
        // (isAdmin &&
        //         dataList[widget.category]![data]![widget.index][detailsIndex] ==
        //             "")
        //     ? InkWell(
        //         onTap: () {
        //           setState(() {
        //             isEditDescription = true;
        //           });
        //         },
        //         child: Container(
        //           height: 50,
        //           width: 100,
        //           color: Colors.yellow,
        //         ))
        //     : const SizedBox(),
        // GestureDetector(
        //   onTap: () {
        //     if (!isAdmin) return;
        //     setState(() {
        //       isEditDescription = true;
        //     });
        //   },
        //   child: isEditDescription
        //       ? SizedBox(
        //           height: 100,
        //           width: MediaQuery.of(context).size.width > mobileWidth
        //               ? MediaQuery.of(context).size.width * 0.4
        //               : MediaQuery.of(context).size.width * 0.7,
        //           child: TextField(
        //             controller: descriptionController,
        //             onSubmitted: (value) {
        //               List<String> description = value.split(",");

        //               dataList[widget.category]![data]![widget.index] = [
        //                 ...dataList[widget.category]![data]![widget.index]
        //                     .sublist(0, 5),
        //                 ...description
        //               ];

        //               setState(() {
        //                 isEditDescription = false;
        //               });
        //             },
        //           ),
        //         )
        //       : Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: List.generate(
        //             dataList[widget.category]![data]![widget.index].length -
        //                 detailsIndex,
        //             (index) => Row(
        //               children: [
        //                 SizedBox(
        //                     width:
        //                         MediaQuery.of(context).size.width <= mobileWidth
        //                             ? 20
        //                             : 0),
        //                 SizedBox(
        //                   width: MediaQuery.of(context).size.width > mobileWidth
        //                       ? MediaQuery.of(context).size.width * 0.5
        //                       : MediaQuery.of(context).size.width * 0.9,
        //                   child: Text(
        //                     dataList[widget.category]![data]![widget.index]
        //                         [detailsIndex + index],
        //                     style: Theme.of(context).textTheme.labelLarge,
        //                     maxLines: 2,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        // ),
      ],
    );
  }
}
