import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/userProvider.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';
import 'package:restrosupply/widgets/checkout/billing.dart';
import 'package:restrosupply/widgets/checkout/orderSumary.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';
import 'package:http/http.dart' as http;

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!context.watch<UserProvider>().login) {
      return const CustomScaffold(
          body: Center(child: Text("You need to login to checkout")));
    }
    return CheckoutPage();
  }
}

class CheckoutPage extends StatelessWidget {
  dynamic getPrice(String userId) async {
    final url = Uri.parse('$BASE_URL/calculate-total');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'user_id': userId}),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Some internal error occured');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: FutureBuilder(
          future: getPrice(context.watch<UserProvider>().uid!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const WaitingWidget();
            } else if (snapshot.hasError) {
              return const LoadingErrorWidget();
            } else {
              dynamic data = snapshot.data!;
              double? money = data["total_price"] as double;
              if (money == 0.0) {
                return Center(
                  child: Text("You haven't checkout yet!"),
                );
              }
              double price = double.parse(money.toStringAsFixed(2));
              return LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > mobileWidth) {
                    // Desktop Layout
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: OrderSummary(price: price),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: BillingForm(price: price),
                          ),
                        ),
                      ],
                    );
                  } else {
                    // Mobile Layout
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          OrderSummary(price: price),
                          const SizedBox(height: 20),
                          BillingForm(price: price),
                        ],
                      ),
                    );
                  }
                },
              );
            }
          }),
    );
  }
}
