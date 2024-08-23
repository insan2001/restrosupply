import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/modules/cartProvider.dart';
import 'package:restrosupply/modules/userProvider.dart';
import 'package:restrosupply/routeConstants.dart';

class BottomColumnWidget extends StatefulWidget {
  final double total;
  const BottomColumnWidget({super.key, required this.total});

  @override
  State<BottomColumnWidget> createState() => BottomColumnWidgetState();
}

class BottomColumnWidgetState extends State<BottomColumnWidget> {
  bool calculated = false;

  @override
  void initState() {
    context.read<Cartprovider>().price = widget.total;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Total : "),
          Text(
            "\$ ${context.watch<Cartprovider>().price.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 24, color: Colors.green),
          ),
          InkWell(
            splashColor: null,
            highlightColor: null,
            onTap: () => context
                .read<Cartprovider>()
                .calculatePrice(context.read<UserProvider>().uid!),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Update",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
          InkWell(
            splashColor: null,
            highlightColor: null,
            onTap: () {
              context.read<Cartprovider>().updated
                  ? context.go(RouteConstants().checkout)
                  : ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please update to checkout")));
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Checkout",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
