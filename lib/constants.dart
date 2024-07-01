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

const String emptyImage =
    "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Fempty.jpg?alt=media&token=6376a7cd-3721-400b-a977-ed93da60b9ef";
const String logoImage =
    "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Flogo.jpg?alt=media&token=c6e4ceed-e1b9-41ed-8d46-b9549de98c9b";

const String localLogoImage = "assets/images/logo.jpg";

late final String myWebsiteURL;

const String companyName = "Restro Supply Hub";
const String suggestText = "You might also like these";

bool isAdmin = false;

String mail = "restro@mail.com";
String password = "pw123456";
