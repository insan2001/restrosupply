import 'package:restrosupply/routeConstants.dart';

final List<List<dynamic>> appbarNameList = [
  ["Home", RouteConstants().home],
  ["Products", "${RouteConstants().category}/$all"],
  ["Contact Us", RouteConstants().contactUs],
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

const String emptyImage = "assets/images/empty.jpg";
const String logoImage = "assets/images/logo.jpg";

const String url = "https://www.restrosupplyhub.com/";

const String companyName = "Restro Supply Hub";
const String suggestText = "You might also like these";
