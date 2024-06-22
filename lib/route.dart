import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/screens/allProduct.dart';
import 'package:restrosupply/screens/contactUs.dart';
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
        path: "${RouteConstants().category}/:category",
        pageBuilder: ((context, state) {
          final String category = state.pathParameters["category"]!;
          String cat = categoryId[category] ?? all;
          return MaterialPage(
              key: state.pageKey, child: AllProducts(category: cat));
        }),
      ),
      GoRoute(
        name: RouteConstants().product,
        path: "${RouteConstants().product}/:category-:id",
        pageBuilder: ((context, state) {
          final String cat = state.pathParameters["category"]!;
          final String num = state.pathParameters["id"]!;
          final String category = categoryId[cat]!;
          return MaterialPage(
              key: state.pageKey,
              child: SingleProduct(
                  key: UniqueKey(), index: int.parse(num), category: category));
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
          return MaterialPage(key: state.pageKey, child: LoginScreen());
        }),
      ),
    ],
  );
}
