import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
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
    return Row(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width <= mobileWidth ? 20 : 0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width > mobileWidth
                  ? MediaQuery.of(context).size.width * 0.5
                  : MediaQuery.of(context).size.width - 20,
              child: Padding(
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
            Text(
              widget.product.quantity != 0
                  ? "Quantity : ${widget.product.quantity}"
                  : "Usually available within 24 hours",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color:
                      widget.product.quantity != 0 ? Colors.black : Colors.red,
                  fontSize: 18),
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

            Row(
              children: [
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
                        color:
                            widget.product.pickup ? Colors.green : Colors.red,
                      ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  widget.product.shipping ? Icons.check : Icons.close,
                  color: widget.product.shipping ? Colors.green : Colors.red,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Delivery",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color:
                            widget.product.shipping ? Colors.green : Colors.red,
                      ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // AddToCartButton(
            //   quantity: widget.product.quantity,
            //   productId: replaceEverything(widget.product.title),
            // )
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
        ),
      ],
    );
  }
}
