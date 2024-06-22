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
        name: "${name} ${index}",
        imageUrl: "",
        stock: true,
        pickup: true,
        shipping: true,
        details: ["PO box no : ${index}", "another data"]);
  }

  factory ProductData.fromJson(Map<String, dynamic> json) {
    if (json['imageUrl'] == null) {
      print(json.runtimeType);
      print(json);
    }
    if (json['name'] == null) {
      print("name null");
    }
    if (json['stock'] == null) {
      print("stock null");
    }
    if (json['pickup'] == null) {
      print("pickup null");
    }
    if (json['shipping'] == null) {
      print("shipping null");
    }
    if (json['details'] == null) {
      print("details null");
    }

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
