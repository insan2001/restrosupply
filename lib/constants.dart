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

const String BASE_URL = "https://insan.pythonanywhere.com/";
const double TAX = 0.13;

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
    "https://firebasestorage.googleapis.com/v0/b/restrosupplyhub.appspot.com/o/images%2Flogo-rsh.jpeg?alt=media&token=2867df90-5f0d-4d56-af10-6413e5013012";

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
const String pieces = "Pieces";
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
const String userProfile = "Profile";
const String userName = "User Name";
const String userMail = "email";
const String userLine = "line";
const String userCity = "city";
const String userState = "state";
const String userPhone = "phone";
const String userPostal = 'postal code';
const String customerId = 'customer id';
const String customerUid = 'customer uid';

// roles

// int superUser = 0;
String admin = "Admin";
String editor = "Editor";
String defaultUser = "User";
// storage
const String storageImage = "images";

// user specifics

const String cart = "cart";
const String cartTotal = "cart total";
const String productId = "Product Id";
const String amount = "Amount";
const String total = "Total Price";

// order key words
const String orders = 'orders';

// shared preferences
const String email = "email";
const String passText = "password";
