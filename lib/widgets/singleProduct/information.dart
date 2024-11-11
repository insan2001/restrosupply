import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/functions/replace.dart';
import 'package:restrosupply/modules/product.dart';
import 'package:restrosupply/modules/userProvider.dart';
import 'package:restrosupply/widgets/singleProduct/addToCart.dart';

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
                        : MediaQuery.of(context).size.width * 0.005),
                child: Text(
                  widget.product.title,
                  style: MediaQuery.of(context).size.width > mobileWidth
                      ? Theme.of(context).textTheme.headlineLarge
                      : Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Text(
            //   widget.product.quantity != -1
            //       ? widget.product.quantity == 0
            //           ? "Quantity (Box)        :    500"
            //           : "Quantity (Box)        :    ${widget.product.quantity}"
            //       : "Usually available within 24 hours",
            //   style: Theme.of(context).textTheme.displaySmall!.copyWith(
            //       color:
            //           widget.product.quantity != -1 ? Colors.black : Colors.red,
            //       fontSize: 18),
            // ),
            // Text(
            //   "Product per box    :    ${widget.product.piece.toString()}",
            //   style: TextStyle(fontSize: 18),
            // ),
            widget.product.details != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        widget.product.details!.length,
                        (index) => Text(
                              widget.product.details![index],
                              style: TextStyle(fontSize: 18),
                            )),
                  )
                : SizedBox(),
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
                      color: widget.product.pickup ? Colors.green : Colors.red,
                      fontSize: 18),
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
                      fontSize: 18),
                ),
              ],
            ),
            Text(
              widget.product.price == -1
                  ? "Price : N/A"
                  : "Price : \$ ${widget.product.price.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: widget.product.price == -1
                      ? Colors.red
                      : Theme.of(context).primaryColor),
            ),
            SizedBox(height: 10),
            context.watch<UserProvider>().login && widget.product.price > 0
                ? AddToCartButton(
                    productId: replaceEverything(widget.product.title),
                    price: widget.product.price,
                  )
                : Text(
                    widget.product.price <= 0 &&
                            context.watch<UserProvider>().login
                        ? "This can't be added now"
                        : "Log in to add to cart",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
