import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/product.dart';

class Category {
  final List<Product> products;
  final String image;
  final String name;
  final String keyword;

  Category(
      {required this.products,
      required this.image,
      required this.name,
      required this.keyword});

  // factory Category.fromMap(Map<String, dynamic> data) {
  //   List<Product> products = [];
  //   for (List<dynamic> data in data["data"]) {
  //     Product pr = Product.fromList(data);
  //     products.add(pr);
  //   }
  //   String IMG = data["CategoryImage"][0][0];
  //   return Category(
  //       products: products,
  //       image: IMG,
  //       name: data["CategoryImage"][0][1],
  //       keyword: data["CategoryImage"][0][1].toString().replaceAll(" ", "_"));
  // }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> productsData = [];

    for (Product product in products) {
      productsData.add(product.toJson());
    }

    return {
      categoryProducts: productsData,
      categoryImage: image,
      categoryName: name,
      keywordd: keyword,
    };
  }
}
