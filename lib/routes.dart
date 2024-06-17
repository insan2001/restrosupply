import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/screens/allProduct.dart';
import 'package:restrosupply/screens/homeScreen.dart';

const String home = "home";
const String allProducts = all;

// GoRouter configuration
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: home,
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: allProducts,
      path: '/${allProducts}',
      builder: (context, state) => AllProducts(category: all),
    ),
  ],
);
