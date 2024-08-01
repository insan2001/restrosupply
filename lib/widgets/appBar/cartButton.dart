import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/product.dart';
import 'package:restrosupply/modules/userProvider.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/body/customImage.dart';
import 'package:restrosupply/widgets/cart/numberInput.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  // void _showDropdown(BuildContext context) {
  // Show a dropdown dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Shopping cart'),
//           actions: [Icon(Icons.arrow_right_alt)],
//           content: SizedBox(
//             width: 480,
//             child: FutureBuilder(
//                 future: FirebaseFirestore.instance
//                     .collection(users)
//                     .doc(context.read<UserProvider>().uid)
//                     .get(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return WaitingWidget();
//                   } else if (snapshot.hasError) {
//                     return LoadingErrorWidget();
//                   } else {
//                     Map<String, dynamic> userData = snapshot.data!.data()!;
//                     List<Map<String, dynamic>> carts = [];
//                     for (Map<String, dynamic> data in userData[cart]) {
//                       carts.add(data);
//                     }
//                     return ListView.builder(
//                       itemCount: carts.length,
//                       itemBuilder: (context, index) => FutureBuilder(
//                           future: FirebaseFirestore.instance
//                               .collection(categoryProducts)
//                               .doc(carts[index][productId])
//                               .get(),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return WaitingWidget();
//                             } else if (snapshot.hasError) {
//                               return LoadingErrorWidget();
//                             } else {
//                               Map<String, dynamic> data =
//                                   snapshot.data!.data()!;
//                               Product product = Product.fromMap(data);
//                               return ListTile(
//                                 textColor:
//                                     (carts[index][amount] > product.quantity ||
//                                             carts[index][amount] == 0)
//                                         ? Colors.red
//                                         : Colors.black,
//                                 leading:
//                                     CustomImageWidget(path: product.img?.first),
//                                 title: Text(product.title),
//                                 subtitle: Row(
//                                   children: [
//                                     Text("${product.price} * "),
// // NumberInputField(controller: controller)
//                                   ],
//                                 ),
//                                 trailing: Icon(Icons.delete),
//                               );
//                             }
//                           }),
//                     );
//                   }
//                 }),
//           ),
//         );
//       },
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        // onPressed: () => _showDropdown(context),
        onPressed: () {
          context.go(RouteConstants().cart);
        },
        icon: Icon(
          Icons.shopping_cart,
          color: Theme.of(context).primaryColor,
        ));
  }
}
