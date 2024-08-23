import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/userProvider.dart';

class AddToCartButton extends StatefulWidget {
  // final int quantity;
  final String productId;
  final double price;
  const AddToCartButton(
      {super.key,
      // required this.quantity,
      required this.productId,
      required this.price});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  late int qty;

  @override
  void initState() {
    qty = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              if (qty == 0) return;
              setState(() {
                qty -= 1;
              });
            },
            icon: Icon(
              Icons.remove_circle_outlined,
              size: 50,
            )),
        Text(
          qty.toString(),
          style: Theme.of(context).textTheme.displaySmall,
        ),
        IconButton(
            onPressed: () {
              // if (widget.quantity == qty) return;
              setState(() {
                qty += 1;
              });
            },
            icon: Icon(Icons.add_circle, size: 50)),
        GestureDetector(
          onTap: () async {
            if (context.read<UserProvider>().login) {
              DocumentReference ref = FirebaseFirestore.instance
                  .collection(users)
                  .doc(context.read<UserProvider>().uid);
              DocumentSnapshot snapshot = await ref.get();
              Map<String, dynamic>? fetchData =
                  snapshot.data() as Map<String, dynamic>;
              Map<String, dynamic> currentCart = fetchData[cart] ?? {};

              // Update or add the product in the cart
              currentCart[widget.productId] = qty;

              // Update the cart in Firestore
              await ref.update({cart: currentCart});

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Product has been added"),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Add to cart",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Icon(Icons.add_shopping_cart)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
