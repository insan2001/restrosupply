import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/body/contacts.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';
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
    keyList.insert(0, all);
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
                  category == all ? all : dataList[category]![catImage]![0][1],
                  style: Theme.of(context).textTheme.displayLarge),
            ),
            const SizedBox(
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
                const Spacer(
                  flex: 1,
                ),
                DropdownButton<String>(
                  dropdownColor: Colors.white,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  hint: Text(
                    category,
                    style: const TextStyle(color: Colors.black),
                  ),
                  items: keyList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (item) {
                    context.goNamed(RouteConstants().category, pathParameters: {
                      "category": valueToID(item ?? all) ?? all
                    });
                    setCategory(item!);
                  },
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
            isDevice(
              desktop: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(
                  left: 100,
                  right: 100,
                  top: 20,
                ),
                itemCount: selectedData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.8),
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                  splashColor: null,
                  highlightColor: null,
                  onTap: () {
                    if (widget.category == all) {
                      int flag = index;
                      late final String category;
                      for (String key in dataList.keys) {
                        if (dataList[key]![data]!.length > flag) {
                          category = valueToID(key)!;
                          break;
                        } else {
                          flag -= dataList[key]![data]!.length;
                        }
                      }
                      context.go(
                        "${RouteConstants().product}/$category-$flag",
                      );
                    } else {
                      context.go(
                        "${RouteConstants().product}/${valueToID(category)}-$index",
                      );
                    }
                  },
                  child:
                      SuggestWidget(index: index, productsData: selectedData),
                ),
              ),
              mobile: ListView.separated(
                padding: const EdgeInsets.only(left: 10, right: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: selectedData.length,
                separatorBuilder: (context, index) => Container(
                  height: 0.5,
                  color: Theme.of(context).primaryColor,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                  hoverColor: Colors.amber,
                  onTap: () {
                    if (widget.category == all) {
                      int flag = index;
                      late final String category;
                      for (String key in dataList.keys) {
                        if (dataList[key]![data]!.length > flag) {
                          category = valueToID(key)!;
                          break;
                        } else {
                          flag -= dataList[key]![data]!.length;
                        }
                      }
                      context.go(
                        "${RouteConstants().product}/$category-$flag",
                      );
                    } else {
                      context.go(
                        "${RouteConstants().product}/${valueToID(category)}-$index",
                      );
                    }
                  },
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.height * 0.1,
                        minHeight: MediaQuery.of(context).size.height * 0.1),
                    child: Image.asset(
                      selectedData[index][imageIndex] == ""
                          ? emptyImage
                          : selectedData[index][imageIndex],
                      fit: BoxFit.cover,
                    ),
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
            const SizedBox(
              height: 20,
            ),
            const ContactDetails(),
          ],
        ),
      ),
    );
  }
}
