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
          leading: const isDevice(
            desktop: CircleImage(
                size: 90,
                imgUrl:
                    "https://fastly.picsum.photos/id/477/200/200.jpg?hmac=pGA68LBET23UPGB7L8xL1pA7PYT_x7JazGX__CnlliU"),
          ),
          backgroundColor: Colors.white,
          title: Center(
            child: isDevice(
              desktop: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: List.generate(
                    appbarNameList.length,
                    (index) => InkWell(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => appbarNameList[index][1],
                              ),
                            ),
                        child: TitleWidget(name: appbarNameList[index][0]))),
              ),
              mobile: CircleImage(
                  size: 90,
                  imgUrl:
                      "https://fastly.picsum.photos/id/477/200/200.jpg?hmac=pGA68LBET23UPGB7L8xL1pA7PYT_x7JazGX__CnlliU"),
            ),
          ),
        ),
        body: body);
  }
}
