import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/main.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/appBar/title.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class CustomScaffold extends StatelessWidget {
  final Widget body;
  const CustomScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                context.go(RouteConstants().login);
              },
              icon: Icon(
                Icons.login,
                color: Theme.of(context).primaryColor,
              )),
          const SizedBox(
            width: 20,
          )
        ],
        title: Center(
          child: isDevice(
            desktop: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: List.generate(
                appbarNameList.length,
                (index) => InkWell(
                  onTap: () => context.go(
                    appbarNameList[index][1],
                  ),
                  child: TitleWidget(
                    name: appbarNameList[index][0],
                  ),
                ),
              ),
            ),
            mobile: Text(
              companyName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
      body: body,
      floatingActionButton: InkWell(
        onTap: () async {
          if (!isAdmin) {
            context.go(RouteConstants().home);
          } else {
            try {
              await ref.putString(jsonEncode(dataList),
                  format: firebase_storage.PutStringFormat.raw);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Data Updated")));
            } catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(e.toString())));
            }
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.black)),
          height: 60,
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: Image.asset(
                  logoImage,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                ).image,
                radius: 30,
              ),
              const Spacer(),
              Text(
                isAdmin ? "Save" : "Home",
                style: TextStyle(fontSize: 32),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
