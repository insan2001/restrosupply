import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/widgets/body/contacts.dart';
import 'package:restrosupply/screens/singleProduct.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';
import 'package:restrosupply/widgets/body/customImage.dart';
import 'package:restrosupply/widgets/singleProduct/moreImage.dart';

class AllProducts extends StatefulWidget {
  final String category;

  const AllProducts({super.key, required this.category});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  late List<List<dynamic>> selectedData;
  late String category;
  late final List<String> keyList;

  setCategory(String cat) {
    setState(() {
      category = cat;
    });
    if (cat == all) {
      List<List<dynamic>> tempData = [];
      String key;
      for (key in dataList.keys) {
        for (List<dynamic> i in dataList[key]![data]!) {
          tempData.add(i);
        }
      }
      setState(() {
        selectedData = tempData;
      });
    } else {
      setState(() {
        selectedData = dataList[category]![data]!;
      });
    }
  }

  @override
  void initState() {
    setCategory(widget.category);
    keyList = dataList.keys.toList();
    keyList.insert(0, "All Products");
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
                  category == all
                      ? "All Products"
                      : dataList[category]![catImage]![0][1],
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
            Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                DropdownButton<String>(
                  dropdownColor: Colors.white,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  hint: Text(
                    category,
                    style: TextStyle(color: Colors.black),
                  ),
                  items: keyList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (item) {
                    setCategory(item ?? all);
                  },
                ),
                Spacer(
                  flex: 3,
                ),
              ],
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
                    childAspectRatio: 0.8),
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                  splashColor: null,
                  highlightColor: null,
                  onTap: () {
                    String cat = category;
                    if (category == all) {
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
                  minTileHeight: MediaQuery.of(context).size.width * 0.4,
                  hoverColor: Colors.amber,
                  onTap: () {
                    String cat = category;
                    if (category == all) {
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
                  leading: CustomImageWidget(
                    path: selectedData[index][imageIndex],
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
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
