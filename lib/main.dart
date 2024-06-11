import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/screens/allProduct.dart';
import 'package:restrosupply/screens/singleProduct.dart';
import 'package:restrosupply/widgets/appBar/title.dart';
import 'package:restrosupply/widgets/circleImage.dart';

void main() async {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.accent,
          buttonColor: Colors.greenAccent,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                toolbarHeight: 90,
                leading: const isDevice(
                  desktop: CircleImage(
                      size: 90,
                      imgUrl:
                          "https://fastly.picsum.photos/id/477/200/200.jpg?hmac=pGA68LBET23UPGB7L8xL1pA7PYT_x7JazGX__CnlliU"),
                ),
                pinned: true,
                backgroundColor: Colors.white,
                title: Center(
                  child: isDevice(
                    desktop: Wrap(
                      alignment: WrapAlignment.spaceAround,
                      children: List.generate(appbarNameList.length,
                          (index) => TitleWidget(name: appbarNameList[index])),
                    ),
                    mobile: CircleImage(
                        size: 90,
                        imgUrl:
                            "https://fastly.picsum.photos/id/477/200/200.jpg?hmac=pGA68LBET23UPGB7L8xL1pA7PYT_x7JazGX__CnlliU"),
                  ),
                ),
              ),
            ];
          },
          body: SingleProduct(index: 2, category: "Category two"),
        ),
      ),
    );
  }
}
