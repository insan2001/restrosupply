import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/functions/uploadImage.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/body/contacts.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';
import 'package:restrosupply/widgets/body/customImage.dart';
import 'package:restrosupply/widgets/listViewProducts.dart';

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

  void setCategory(String cat) {
    setState(() {
      category = cat;
      selectedData = [];
      if (cat == all) {
        List<List<dynamic>> tempData = [];
        for (String key in dataList.keys) {
          tempData.addAll(dataList[key]![data]!);
        }
        selectedData = tempData;
      } else {
        selectedData = dataList[category]![data]!;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setCategory(widget.category);
    keyList = dataList.keys.toList();
    keyList.insert(0, all);
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
                style: Theme.of(context).textTheme.displayLarge,
              ),
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
                const Spacer(flex: 1),
                DropdownButton<String>(
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
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
                const Spacer(flex: 3),
              ],
            ),
            isDevice(
                desktop: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.only(left: 100, right: 100, top: 20),
                  itemCount: selectedData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                    splashColor: null,
                    highlightColor: null,
                    onTap: () {
                      if (widget.category == all) {
                        int flag = index;
                        late final String selectedCategory;
                        for (String key in dataList.keys) {
                          if (dataList[key]![data]!.length > flag) {
                            selectedCategory = valueToID(key)!;
                            break;
                          } else {
                            flag -= dataList[key]![data]!.length;
                          }
                        }
                        context.go(
                          "${RouteConstants().product}/$selectedCategory-$flag",
                        );
                      } else {
                        context.go(
                          "${RouteConstants().product}/${valueToID(category)}-$index",
                        );
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2 * 0.8,
                      height: MediaQuery.of(context).size.width * 0.2,
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                CustomImageWidget(
                                  path: selectedData[index][imageIndex],
                                  height: MediaQuery.of(context).size.width >
                                          mobileWidth
                                      ? MediaQuery.of(context).size.width * 0.2
                                      : MediaQuery.of(context).size.width * 0.8,
                                  width: MediaQuery.of(context).size.width >
                                          mobileWidth
                                      ? MediaQuery.of(context).size.width * 0.2
                                      : MediaQuery.of(context).size.width * 0.8,
                                ),
                                if (isAdmin && (category != all))
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () async {
                                        String text = await uploadFile(
                                            "${categoryId.keys.toList()[categoryId.values.toList().indexOf(category)]}-$index");
                                        print(
                                            "${dataList[category]![data]![index]}");
                                        setState(() {});
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                                SnackBar(content: Text(text)));
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                if (isAdmin && (category != all))
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              dataList[category]![data]![index]
                                                  [imageIndex] = "";
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 50,
                                          )))
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            selectedData[index][textIndex],
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                mobile: MyCustomListView(
                    selectedData: selectedData, category: category)),
            const SizedBox(height: 20),
            const ContactDetails(),
          ],
        ),
      ),
    );
  }
}
