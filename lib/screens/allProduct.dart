import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/widgets/circleImage.dart';

class AllProducts extends StatefulWidget {
  final String category;

  const AllProducts({super.key, required this.category});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  late final List<List<dynamic>> selectedData;
  @override
  void initState() {
    if (widget.category == all) {
      List<List<dynamic>> tempData = [];
      String key;
      for (key in dataList.keys) {
        for (List<dynamic> i in dataList[key]![data]!) {
          tempData.add(i);
        }
      }
      selectedData = tempData;
    } else {
      selectedData = dataList[widget.category]![data]!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Text(
              widget.category,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "${selectedData.length} item(s) found",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          isDevice(
            desktop: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                left: 100,
                right: 100,
                top: 20,
              ),
              itemCount: selectedData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
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
                      selectedData[index][imageIndex],
                      fit: BoxFit.fitWidth,
                      height: 200,
                    ),
                    Text(
                      selectedData[index][textIndex],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ),
            mobile: ListView.separated(
              padding: EdgeInsets.only(left: 10, right: 10),
              physics: NeverScrollableScrollPhysics(),
              itemCount: selectedData.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 5,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                leading: CircleImage(
                  imgUrl: selectedData[index][imageIndex],
                  size: 40,
                ),
                title: Text(
                  selectedData[index][textIndex],
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
