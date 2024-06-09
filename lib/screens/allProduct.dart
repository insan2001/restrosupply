import 'package:flutter/material.dart';

const String data = "data";
const String catImage = "CategoryImage";

// name, imageUrl, stock, pickup, shipping, details

class AllProducts extends StatefulWidget {
  final String title;
  final List<List<dynamic>> dataList;
  const AllProducts({super.key, required this.title, required this.dataList});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Center(
          child: Text(
            "${widget.dataList.length} item(s) found",
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: 100,
              right: 100,
              top: 20,
            ),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(
                widget.dataList.length,
                (index) => Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        widget.dataList[index][1],
                        fit: BoxFit.fitWidth,
                        height: 200,
                      ),
                      Text(
                        widget.dataList[index][0],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
