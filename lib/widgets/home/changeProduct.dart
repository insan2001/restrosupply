import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/routeConstants.dart';
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
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      IconButton(
        onPressed: () {
          setState(() {
            if (_productIndex != 0) _productIndex -= 1;
          });
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: _productIndex == 0 ? Colors.grey : Colors.red,
          size: MediaQuery.of(context).size.width * 0.05,
        ),
      ),
      ...List.generate(
        3,
        (index) => InkWell(
          splashColor: null,
          highlightColor: null,
          onTap: () {
            String? category = valueToID(widget.keys[widget.index]);
            context.go(
                "${RouteConstants().product}/$category-${_productIndex + index}");
          },
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    right: 10, left: 10, top: 15, bottom: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.width / 4.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomImageWidget(
                      path: dataList[widget.keys[widget.index]]![data]![
                          index + _productIndex][imageIndex],
                      height: MediaQuery.of(context).size.width / 9,
                      width: MediaQuery.of(context).size.width / 9,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      dataList[widget.keys[widget.index]]![data]![
                          index + _productIndex][textIndex],
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          setState(() {
            if (_productIndex + 3 <
                dataList[widget.keys[widget.index]]![data]!.length) {
              _productIndex += 1;
            }
          });
        },
        icon: Icon(
          Icons.arrow_forward_ios,
          color: _productIndex + 3 ==
                  dataList[widget.keys[widget.index]]![data]!.length
              ? Colors.grey
              : Colors.red,
          size: MediaQuery.of(context).size.width * 0.05,
        ),
      ),
    ]);
  }
}
