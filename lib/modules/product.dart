import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';

class Product {
  final String title;
  final double? price;
  final List<String>? img;
  final List<dynamic>? details;
  bool stock = true;
  bool pickup = true;
  bool shipping = true;

  Product({
    required this.title,
    this.price,
    this.img,
    this.details,
    required this.stock,
    required this.pickup,
    required this.shipping,
  });

  factory Product.fromMap(Map<String, dynamic> data) => Product(
      title: data[titlee],
      img: data[images],
      price: data[prices],
      details: data[detailss],
      stock: data[stocks],
      pickup: data[pickups],
      shipping: data[shippings]);

  factory Product.fromList(List<dynamic> data) {
    int priceInt = data.length - 2;
    return Product(
      title: data[textIndex],
      img: [data[imageIndex]],
      stock: data[stockIndex],
      pickup: data[pickupIndex],
      shipping: data[shippingIndex],
      details: data.last.split("Price").length > 1
          ? data.sublist(detailsIndex, priceInt)
          : dataList.length > priceInt + 1
              ? [data[detailsIndex]]
              : data.sublist(detailsIndex, priceInt + 1),
      price: data.last.split("Price").length > 1
          ? double.parse(data.last.split("\$").last)
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      titlee: title,
      images: img,
      stocks: stock,
      pickups: pickup,
      shippings: shipping,
      detailss: details,
      prices: price,
    };
  }
}
