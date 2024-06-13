import 'package:flutter/material.dart';
import 'package:restrosupply/screens/singleProduct.dart';
import 'package:restrosupply/widgets/singleProduct/moreImage.dart';

class SuggestGridWidget extends StatelessWidget {
  final List<List<dynamic>> productsData;
  final int num;
  final int index;
  final String category;
  const SuggestGridWidget(
      {super.key,
      required this.productsData,
      required this.num,
      required this.index,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: num,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1),
        shrinkWrap: true,
        itemCount: productsData.length <= 8 ? productsData.length : 8,
        itemBuilder: (context, _index) => GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      SingleProduct(index: index, category: category))),
          child: SuggestWidget(index: _index, productsData: productsData),
        ),
      ),
    );
  }
}
