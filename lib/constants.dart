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

const String companyName = "Resto Supply Hub";
const String suggestText = "Customers also bought";

// String mail = "resto@mail.com";
// String password = "pw123456";

const String verify = "isCategory";

// product keywords
const String titlee = "Title";
const String prices = "Price";
const String images = "Images";
const String detailss = "Details";
const String stocks = "Stock";
const String pickups = "Pickup";
const String shippings = "Shipping";
const String qty = "Quantity";
const String location = "Location";
const String imageStore = "imageStorage";

// category keywords
const String category = "category";
const String categoryProducts = "products";
const String categoryImage = 'Image';
const String categoryName = "name";
const String keywordd = "keyword";

// auth keywords
const String users = "users";
const String position = "position";
String userProfile = "Profile";
String userName = "User Name";
// roles

// int superUser = 0;
String admin = "Admin";
String editor = "Editor";
String defaultUser = "User";
// storage
const String storageImage = "images";

// user specifics

const String cart = "cart";
const String productId = "Product Id";
const String amount = "Amount";

// shared preferences
const String email = "email";
const String passText = "password";
