import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/screens/cart.dart';
import 'package:restrosupply/screens/category.dart';
import 'package:restrosupply/screens/contactUs.dart';
import 'package:restrosupply/screens/dev.dart';
import 'package:restrosupply/screens/edit.dart';
import 'package:restrosupply/screens/error.dart';
import 'package:restrosupply/screens/homeScreen.dart';
import 'package:restrosupply/screens/login.dart';
import 'package:restrosupply/screens/payment.dart';
import 'package:restrosupply/screens/product.dart';
import 'package:restrosupply/screens/profile.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: RouteConstants().home,
    errorBuilder: (context, state) => const ErrorScreen(),
    routes: [
      GoRoute(
        name: RouteConstants().home,
        path: RouteConstants().home,
        pageBuilder: ((context, state) =>
            MaterialPage(key: state.pageKey, child: const HomeScreen())),
      ),
      GoRoute(
        name: RouteConstants().category,
        path: "${RouteConstants().category}/:categoryId",
        pageBuilder: ((context, state) {
          final String categoryId = state.pathParameters["categoryId"]!;
          return MaterialPage(
              key: state.pageKey, child: AllProducts(category: categoryId));
        }),
      ),
      GoRoute(
        name: RouteConstants().product,
        path: "${RouteConstants().product}/:product",
        pageBuilder: ((context, state) {
          final String product = state.pathParameters["product"]!;
          return MaterialPage(
              key: state.pageKey,
              child: SingleProduct(
                key: UniqueKey(),
                productId: product,
              ));
        }),
      ),
      GoRoute(
        name: RouteConstants().edit,
        path: "${RouteConstants().edit}/:product",
        pageBuilder: ((context, state) {
          final String product = state.pathParameters["product"]!;
          return MaterialPage(
              key: state.pageKey,
              child: ProductEditorScreen(
                key: UniqueKey(),
                id: product,
              ));
        }),
      ),
      GoRoute(
        name: RouteConstants().profile,
        path: "${RouteConstants().profile}/:profile",
        pageBuilder: ((context, state) {
          final String profile = state.pathParameters["profile"]!;
          return MaterialPage(
              key: state.pageKey, child: UserProfileScreen(id: profile));
        }),
      ),
      GoRoute(
        name: RouteConstants().cart,
        path: RouteConstants().cart,
        pageBuilder: ((context, state) {
          return MaterialPage(key: state.pageKey, child: ShoppinCartScreen());
        }),
      ),
      GoRoute(
        name: RouteConstants().contactUs,
        path: RouteConstants().contactUs,
        pageBuilder: ((context, state) {
          return MaterialPage(
              key: state.pageKey, child: const ContactUsScreen());
        }),
      ),
      GoRoute(
        name: RouteConstants().login,
        path: RouteConstants().login,
        pageBuilder: ((context, state) {
          return MaterialPage(key: state.pageKey, child: const LoginScreen());
        }),
      ),
      GoRoute(
        name: RouteConstants().dev,
        path: RouteConstants().dev,
        pageBuilder: ((context, state) {
          return MaterialPage(key: state.pageKey, child: const DevScreen());
        }),
      ),
      GoRoute(
        name: RouteConstants().payment,
        path: RouteConstants().payment,
        pageBuilder: ((context, state) {
          return MaterialPage(key: state.pageKey, child: const PaymentScreen());
        }),
      ),
    ],
  );
}
