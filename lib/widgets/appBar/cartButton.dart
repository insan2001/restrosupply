import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/routeConstants.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.go(RouteConstants().cart);
        },
        icon: Icon(
          Icons.shopping_cart,
          color: Theme.of(context).primaryColor,
        ));
  }
}
