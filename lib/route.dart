import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/screens/allProduct.dart';
import 'package:restrosupply/screens/contactUs.dart';
import 'package:restrosupply/screens/dev.dart';
import 'package:restrosupply/screens/error.dart';
import 'package:restrosupply/screens/homeScreen.dart';
import 'package:restrosupply/screens/login.dart';
import 'package:restrosupply/screens/singleProduct.dart';

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
    ],
  );
}
