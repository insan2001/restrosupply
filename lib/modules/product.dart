import 'package:restrosupply/constants.dart';

class Product {
  String title;
  double? price;
  List<Map<String, String>> img;
  // List<dynamic>? details;
  List<String>? details;
  bool stock;
  bool pickup;
  bool shipping;
  int quantity;

  Product({
    required this.title,
    this.price,
    this.details,
    required this.img,
    required this.stock,
    required this.pickup,
    required this.shipping,
    required this.quantity,
  });

  factory Product.fromMap(Map<String, dynamic> data) {
    List<Map<String, String>> imgs = [];
    for (Map<String, dynamic> imgData in data[images]) {
      Map<String, String> temp = {};
      temp[images] = imgData[images] ?? "";
      temp[imageStore] = imgData[imageStore] ?? "";
      imgs.add(temp);
    }
    List<String> details = [];
    for (String detail in data[detailss].split(",")) {
      details.add(detail);
    }

    return Product(
      title: data[titlee],
      img: imgs,
      price: data[prices],
      details: details,
      stock: data[stocks],
      pickup: data[pickups],
      shipping: data[shippings],
      quantity: data[qty] ?? 0,
    );
  }

  factory Product.fromList(List<dynamic> data) {
    int priceInt = data.length - 2;
    List<String>? d = [];
    if (data.last.split("Price").length > 1) {
      for (String s in data.sublist(detailsIndex, priceInt)) {
        d.add(s);
      }
    } else {
      if (data.length > priceInt + 1) {
        d = [data[detailsIndex]];
      } else {
        for (String s in data.sublist(detailsIndex, priceInt + 1)) {
          d.add(s);
        }
      }
    }

    return Product(
      title: data[textIndex],
      img: [
        {imageStore: "", images: data[imageIndex]}
      ],
      stock: data[stockIndex],
      pickup: data[pickupIndex],
      shipping: data[shippingIndex],
      details: d,
      price: data.last.split("Price").length > 1
          ? double.parse(data.last.split("\$").last)
          : null,
      quantity: 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      titlee: title,
      images: img,
      stocks: stock,
      pickups: pickup,
      shippings: shipping,
      detailss: details?.join(","),
      prices: price,
      qty: quantity,
    };
  }
}
