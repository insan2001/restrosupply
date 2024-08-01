import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/modules/userProvider.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/appBar/title.dart';
import 'package:restrosupply/widgets/body/customImage.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;
  final Widget? float;
  const CustomScaffold({super.key, required this.body, this.float});

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
          // CartButton(),
          IconButton(
              onPressed: () async {
                if (context.read<UserProvider>().login) {
                  context.go(
                      "${RouteConstants().profile}/${context.read<UserProvider>().uid}");
                } else {
                  context.go(RouteConstants().login);
                }
              },
              icon: context.watch<UserProvider>().login
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CustomImageWidget(
                          path: context.watch<UserProvider>().profileImg))
                  : Icon(
                      Icons.account_circle_sharp,
                      color: Theme.of(context).primaryColor,
                    )),
          const SizedBox(
            width: 20,
          )
        ],
        leading: GestureDetector(
            onTap: () => context.go(RouteConstants().home),
            child: const CustomImageWidget(path: logoImage)),
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
      floatingActionButton: widget.float ?? SizedBox(),
    );
  }
}
