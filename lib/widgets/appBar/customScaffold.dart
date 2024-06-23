import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/functions/writeData.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/appBar/addDataPopup.dart';
import 'package:restrosupply/widgets/appBar/removeDataPopup.dart';
import 'package:restrosupply/widgets/appBar/title.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;
  const CustomScaffold({super.key, required this.body});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  late final List<Widget> adminWidget;

  @override
  void initState() {
    adminWidget = [];
    super.initState();
  }

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
      body: widget.body,
      floatingActionButton: SizedBox(
        height: 140,
        width: 200,
        child: Column(
          mainAxisAlignment:
              isAdmin ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
          children: [
            isAdmin
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AddDataPopupWidget(),
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            size: 35,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => RemoveDataPopupWidget(),
                            );
                          },
                          icon: Icon(
                            Icons.remove,
                            size: 35,
                          ),
                        ),
                      )
                    ],
                  )
                : SizedBox(),
            InkWell(
              onTap: () async {
                if (!isAdmin) {
                  context.go(RouteConstants().home);
                } else {
                  writeData(context);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black)),
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
          ],
        ),
      ),
    );
  }
}
