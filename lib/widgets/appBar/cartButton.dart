import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  void _showDropdown(BuildContext context) {
    // Show a dropdown dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Shopping cart'),
            content: ListView.builder(
                itemBuilder: (index, context) => FutureBuilder(
                    future: null,
                    builder: (context, snapshot) {
                      return ListTile();
                    })));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: null,
        icon: Icon(
          Icons.shopping_cart,
          color: Theme.of(context).primaryColor,
        ));
  }
}
