class ProductData {
  String name;
  String imageUrl;
  bool stock;
  bool pickup;
  bool shipping;
  List<String> details;

  ProductData(
      {required this.name,
      required this.imageUrl,
      required this.stock,
      required this.pickup,
      required this.shipping,
      required this.details});

  factory ProductData.create(int index, String name) {
    return ProductData(
        name: "$name $index",
        imageUrl: "",
        stock: true,
        pickup: true,
        shipping: true,
        details: ["PO box no : $index", "another data"]);
  }

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      name: json['name'],
      imageUrl: json['imageUrl'],
      stock: json['stock'],
      pickup: json['pickup'],
      shipping: json['shipping'],
      details: List<String>.from(json['details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'stock': stock,
      'pickup': pickup,
      'shipping': shipping,
      'details': details,
    };
  }
}
