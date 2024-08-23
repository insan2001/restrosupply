import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/functions/placeOrder.dart';
import 'package:restrosupply/modules/cartProvider.dart';
import 'package:restrosupply/modules/userProvider.dart';
import 'package:restrosupply/routeConstants.dart';

class BillingForm extends StatefulWidget {
  final double price;
  const BillingForm({super.key, required this.price});

  @override
  _BillingFormState createState() => _BillingFormState();
}

class _BillingFormState extends State<BillingForm> {
  final _formKey = GlobalKey<FormState>();
  stripe.CardFieldInputDetails? _cardDetails;

  bool _isLoading = false;
  String _paymentStatus = '';

  String? _name;
  String? _email;
  String? _phoneNumber;
  String? _address;
  String? _city;
  String? _state;
  String? _zipCode;

  Future<Map<String, dynamic>> _handlePayment(
      double moneyInDouble,
      String name,
      String email,
      String phone,
      String address,
      String city,
      String state,
      String zip) async {
    try {
      // Call your backend to create a PaymentIntent
      // Obtain client secret from your backend
      final jsonResponse = await _createPaymentIntent(
          int.parse((moneyInDouble * 100).toStringAsFixed(0)),
          name,
          email,
          phone,
          address,
          city,
          state,
          zip);
      final clientSecret = jsonResponse['client_secret'];
      // Confirm the payment with the obtained client secret

      final payment = await stripe.Stripe.instance.confirmPayment(
        paymentIntentClientSecret: clientSecret!,
        data: stripe.PaymentMethodParams.card(
          paymentMethodData: stripe.PaymentMethodData(
            shippingDetails: stripe.ShippingDetails(
              name: name,
              phone: phone,
              address: stripe.Address(
                city: city,
                country: "CA",
                line1: address,
                line2: city,
                postalCode: zip,
                state: state,
              ),
            ),
          ),
        ),
      );

      return {
        'status': true,
        'data': {
          'payment_id': payment.id,
          'customer_id': jsonResponse['customer_id']
        }
      };
    } catch (e) {
      return {'status': false, 'data': e.toString()};
    }
  }

  Future<dynamic> _createPaymentIntent(
      int moneyInDouble,
      String name,
      String email,
      String phone,
      String address,
      String city,
      String state,
      String zip) async {
    final url = Uri.parse('$BASE_URL/create-payment-intent');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'amount': moneyInDouble,
        'customerData': {
          'name': name,
          'phone': phone,
          "email": email,
          'address': {
            'line1': address,
            'city': city,
            'state': state,
            'country': "CA",
            'postal_code': zip,
          }
        },
        "shipping": {
          "name": name,
          'address': {
            'line1': address,
            'city': city,
            'state': state,
            'country': "CA",
            'postal_code': zip,
          },
          "phone": phone
        },
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to create payment intent');
    }
  }

  Widget _buildLoadingOverlay() {
    return Container(
      color: Colors.black54,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _showPaymentStatusDialog(bool success, String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(success ? 'Payment Successful' : 'Payment Failed'),
          content: Text(success
              ? 'Your payment was processed successfully.'
              : 'There was an issue processing your payment. Please try again. $error'),
          actions: [
            TextButton(
              onPressed: () {
                context.go(RouteConstants().home);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          _isLoading ? _buildLoadingOverlay() : Container(),
          Form(
            key: _formKey,
            child: ListView(
              children: [
                stripe.CardField(
                  onCardChanged: (card) {
                    setState(() {
                      _cardDetails = card;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                // Name Field
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value,
                ),
                const SizedBox(height: 16.0),

                // Email Field
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value,
                ),
                const SizedBox(height: 16.0),

                // Phone Number Field
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    prefix: Text("+1 "),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) => _phoneNumber = value,
                ),
                SizedBox(height: 16.0),

                // Address Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Shipping Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your shipping address';
                    }
                    return null;
                  },
                  onSaved: (value) => _address = value,
                ),
                SizedBox(height: 16.0),

                // City Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                  onSaved: (value) => _city = value,
                ),
                SizedBox(height: 16.0),

                // State Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'State/Province',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your state or province';
                    }
                    return null;
                  },
                  onSaved: (value) => _state = value,
                ),
                SizedBox(height: 16.0),

                // Zip Code Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'ZIP/Postal Code',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your ZIP or postal code';
                    }
                    return null;
                  },
                  onSaved: (value) => _zipCode = value,
                ),
                SizedBox(height: 24.0),

                // Submit Button
                ElevatedButton(
                  onPressed: () async {
                    if (_isLoading) return;
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      // Process the data
                      if (_cardDetails?.complete == true) {
                        setState(() {
                          _isLoading = true;
                          _paymentStatus = '';
                        });
                        await FirebaseFirestore.instance
                            .collection(users)
                            .doc(context.read<UserProvider>().uid)
                            .update({
                          userName: "$_name",
                          userMail: _email,
                          userLine: _address,
                          userCity: _city,
                          userPostal: _zipCode,
                          userState: _state,
                          userPhone: _phoneNumber,
                        });
                        Map<String, dynamic> paymentStatus =
                            await _handlePayment(
                                widget.price,
                                _name!,
                                _email!,
                                _phoneNumber!,
                                _address!,
                                _city!,
                                _state!,
                                _zipCode!);

                        if (paymentStatus['status']) {
                          String intentId = paymentStatus['data']['payment_id'];

                          // final emailUrl = Uri.parse('$BASE_URL/send-mail');

                          // await http.post(
                          //   emailUrl,
                          //   headers: {
                          //     'Content-Type': 'application/json',
                          //   },
                          //   body: jsonEncode(
                          //       {'uid': context.read<UserProvider>().uid}),
                          // );

                          final url = Uri.parse('$BASE_URL/place-order');

                          await http.post(
                            url,
                            headers: {
                              'Content-Type': 'application/json',
                            },
                            body: jsonEncode({
                              'other_data': {
                                'uid': context.read<UserProvider>().uid,
                                'customer_id': paymentStatus['data']
                                    ['customer_id']
                              },
                              'order_list': context
                                  .read<Cartprovider>()
                                  .priceList
                                  .keys
                                  .toList(),
                              'order_id': intentId,
                            }),
                          );

                          // await placeOrder(
                          //     {
                          //       customerUid: context.read<UserProvider>().uid,
                          //       customerId: paymentStatus['data']['customer_id']
                          //     },
                          //     context.read<UserProvider>().uid!,
                          //     context
                          //         .read<Cartprovider>()
                          //         .priceList
                          //         .keys
                          //         .toList(),
                          //     intentId);
                        }
                        setState(() {
                          _isLoading = false;
                          _paymentStatus = paymentStatus['status']
                              ? 'Payment Successful'
                              : paymentStatus['data'];
                        });
                        _showPaymentStatusDialog(
                            paymentStatus['status'], _paymentStatus);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Credit card information required")));
                      }
                    }
                  },
                  child: const Text('Pay now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
