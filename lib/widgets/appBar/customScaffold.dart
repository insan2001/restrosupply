import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/widgets/appBar/title.dart';
import 'package:restrosupply/widgets/circleImage.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  const CustomScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: Colors.white,
          title: Center(
            child: isDevice(
              desktop: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: List.generate(
                    appbarNameList.length,
                    (index) => InkWell(
                        onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => appbarNameList[index][1],
                              ),
                            ),
                        child: TitleWidget(name: appbarNameList[index][0]))),
              ),
              mobile: CircleImage(size: 90, path: logoImage),
            ),
          ),
        ),
        body: body);
  }
}
