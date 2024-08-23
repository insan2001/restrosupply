import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restrosupply/constants.dart';

Future<void> placeOrder(Map<String, dynamic> otherData, String uid,
    List<String> orderList, String id) async {
  final firestore = FirebaseFirestore.instance;

  // Reference to the user's cart document
  final cartRef = firestore.collection(users).doc(uid);
  final ordersRef = firestore.collection(orders).doc(id);

  try {
    // Get current cart data
    final cartSnapshot = await cartRef.get();
    final currentCart =
        cartSnapshot.data()?[cart] as Map<String, dynamic>? ?? {};

    // Prepare the ordered products
    final orderedProducts = <String, dynamic>{};

    // Remove ordered products from the cart and add them to the orderedProducts map
    for (final productId in orderList) {
      if (currentCart.containsKey(productId)) {
        final quantity = currentCart.remove(productId);
        orderedProducts[productId] = quantity;
      }
    }

    // final url = Uri.parse('http://127.0.0.1:4242/sent-mail');
    // http.post(
    //   url,
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    //   body: jsonEncode(orderedProducts),
    // );

    // Update the user's cart in Firestore
    await cartRef.update({cart: currentCart, total: null});

    // Add the ordered products to the orders collection
    await ordersRef.set({orders: orderedProducts, "others": otherData});
  } catch (e) {
    e;
  }
}
