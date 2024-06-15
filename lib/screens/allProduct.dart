import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/widgets/body/contacts.dart';
import 'package:restrosupply/screens/singleProduct.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';
import 'package:restrosupply/widgets/circleImage.dart';
import 'package:restrosupply/widgets/singleProduct/moreImage.dart';

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
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                  widget.category == all
                      ? "All Products"
                      : dataList[widget.category]![catImage]![0][1],
                  style: Theme.of(context).textTheme.displayLarge),
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
                itemBuilder: (context, index) => InkWell(
                  splashColor: null,
                  highlightColor: null,
                  onTap: () {
                    String cat = widget.category;
                    if (widget.category == all) {
                      for (String key in dataList.keys) {
                        if (index <= dataList[key]![data]!.length - 1) {
                          cat = key;
                          break;
                        } else {
                          index -= dataList[key]![data]!.length;
                        }
                      }
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SingleProduct(index: index, category: cat),
                      ),
                    );
                  },
                  child:
                      SuggestWidget(index: index, productsData: selectedData),
                ),
              ),
              mobile: ListView.separated(
                padding: EdgeInsets.only(left: 10, right: 10),
                physics: NeverScrollableScrollPhysics(),
                itemCount: selectedData.length,
                separatorBuilder: (context, index) => Container(
                  height: 0.5,
                  color: Theme.of(context).primaryColor,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    String cat = widget.category;
                    if (widget.category == all) {
                      for (String key in dataList.keys) {
                        if (index <= dataList[key]![data]!.length) {
                          cat = key;
                          break;
                        } else {
                          index -= dataList[key]!.length;
                        }
                      }
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SingleProduct(index: index, category: cat),
                      ),
                    );
                  },
                  leading: CircleImage(
                    path: selectedData[index][imageIndex] == ""
                        ? emptyImage
                        : selectedData[index][imageIndex],
                    size: 40,
                  ),
                  title: Text(
                    selectedData[index][textIndex],
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ContactDetails(),
          ],
        ),
      ),
    );
  }
}
