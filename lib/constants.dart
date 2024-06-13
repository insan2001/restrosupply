import 'package:restrosupply/screens/allProduct.dart';
import 'package:restrosupply/screens/contactUs.dart';
import 'package:restrosupply/screens/homeScreen.dart';

final List<List<dynamic>> appbarNameList = [
  ["Home", HomeScreen()],
  ["Products", AllProducts(category: all)],
  [
    "About Us",
  ],
  ["Contact Us", ContactUsScreen()],
];

const String data = "data";
const String catImage = "CategoryImage";
const double mobileWidth = 750;

// name, imageUrl, stock, pickup, shipping, details

const int textIndex = 0;
const int imageIndex = 1;
const int stockIndex = 2;
const int pickupIndex = 3;
const int shippingIndex = 4;
const int detailsIndex = 5;

const String all = "All Products";
