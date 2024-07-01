import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/routeConstants.dart';

class MyCustomListView extends StatelessWidget {
  final List<List<dynamic>> selectedData;
  final String category;
  const MyCustomListView(
      {super.key, required this.selectedData, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 10, right: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: selectedData.length,
      separatorBuilder: (context, index) => Container(
        height: 0.5,
        color: Theme.of(context).primaryColor,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) => ListTile(
        hoverColor: Theme.of(context).primaryColor,
        onTap: () {
          if (category == all) {
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
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.height * 0.1,
            minHeight: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Image.network(
            selectedData[index][imageIndex] == ""
                ? emptyImage
                : selectedData[index][imageIndex],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              selectedData[index][imageIndex] == ""
                  ? emptyImage
                  : selectedData[index][imageIndex],
              fit: BoxFit.cover,
            ),
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
    );
  }
}
