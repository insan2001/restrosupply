import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';

class OrderSummary extends StatefulWidget {
  final double price;
  const OrderSummary({super.key, required this.price});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  late final double price;
  late final double taxAmount;
  late final double paymentAmount;
  late final double totalPrice;

  @override
  void initState() {
    price = widget.price;
    taxAmount = price * TAX;
    paymentAmount = ((price + taxAmount) * 0.029) + 0.3;
    totalPrice = price + taxAmount + paymentAmount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Order Summary', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal'),
                Text('\$ $price'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tax'),
                Text('\$ ${(taxAmount).toStringAsFixed(2)}'),
              ],
            ),
            const SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Text('Payment charge'),
            //     Text('\$ ${paymentAmount.toStringAsFixed(2)}'),
            //   ],
            // ),
            // const SizedBox(height: 20),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('\$ ${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
