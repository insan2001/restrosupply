import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/screens/singleProduct.dart';
import 'package:restrosupply/widgets/singleProduct/moreImage.dart';

class SuggestGridWidget extends StatefulWidget {
  final String category;
  const SuggestGridWidget({super.key, required this.category});

  @override
  State<SuggestGridWidget> createState() => _SuggestGridWidgetState();
}

class _SuggestGridWidgetState extends State<SuggestGridWidget> {
  late final List<List<dynamic>> productsData;

  @override
  void initState() {
    productsData = dataList[widget.category]![data]!.take(8).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).size.width > mobileWidth ? 4 : 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1),
        shrinkWrap: true,
        itemCount: productsData.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      SingleProduct(index: index, category: widget.category))),
          child: SuggestWidget(index: index, productsData: productsData),
        ),
      ),
    );
  }
}
