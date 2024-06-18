import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/screens/singleProduct.dart';
import 'package:restrosupply/widgets/body/customImage.dart';

class ProductSideviewWidget extends StatefulWidget {
  final List<String> keys;
  final int index;
  const ProductSideviewWidget(
      {super.key, required this.keys, required this.index});

  @override
  State<ProductSideviewWidget> createState() => _ProductSideviewWidgetState();
}

class _ProductSideviewWidgetState extends State<ProductSideviewWidget> {
  int _productIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
        onPressed: () {
          setState(() {
            if (_productIndex != 0) _productIndex -= 1;
          });
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: _productIndex == 0 ? Colors.grey : Colors.red,
          size: 50,
        ),
      ),
      ...List.generate(
        3,
        (_index) => InkWell(
          splashColor: null,
          highlightColor: null,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SingleProduct(
                index: _index,
                category: widget.keys[widget.index],
              ),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 10, left: 10, top: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.width / 5,
                child: Column(
                  children: [
                    CustomImageWidget(
                      path: dataList[widget.keys[widget.index]]![data]![
                          _index + _productIndex][imageIndex],
                      height: MediaQuery.of(context).size.width / 8,
                      width: MediaQuery.of(context).size.width / 8,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      dataList[widget.keys[widget.index]]![data]![_index]
                          [textIndex],
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          setState(() {
            if (_productIndex + 3 <
                dataList[widget.keys[widget.index]]![data]!.length)
              _productIndex += 1;
          });
        },
        icon: Icon(
          Icons.arrow_forward_ios,
          color: _productIndex + 3 ==
                  dataList[widget.keys[widget.index]]![data]!.length
              ? Colors.grey
              : Colors.red,
          size: 50,
        ),
      ),
    ]);
  }
}
