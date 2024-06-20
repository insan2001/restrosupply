import 'package:flutter/material.dart';
import 'package:restrosupply/data.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';
import 'package:restrosupply/widgets/body/contacts.dart';
import 'package:restrosupply/widgets/home/banner.dart';
import 'package:restrosupply/widgets/home/catergoryProduct.dart';
import 'package:restrosupply/widgets/home/commitment.dart';
import 'package:restrosupply/widgets/home/commitmentText.dart';
import 'package:restrosupply/widgets/home/containerThree.dart';
import 'package:restrosupply/widgets/home/horizondalCategory.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<String> keys;

  @override
  void initState() {
    keys = dataList.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BannerWidget(),
            Container(
              color: Theme.of(context).primaryColor,
              height: 2,
            ),
            HorizondalWidget(keys: keys),
            Container(
              color: Theme.of(context).primaryColor,
              height: 2,
            ),
            const ThreeWidget(),
            Container(
              color: Theme.of(context).primaryColor,
              height: 2,
            ),
            CatergoryproductWidget(keys: keys),
            Container(
              color: Theme.of(context).primaryColor,
              height: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            isDevice(
              desktop: Row(
                children: [
                  const Spacer(),
                  const CommitImageWidget(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                    height: 20,
                  ),
                  const CommitTextWidget(),
                  const Spacer(),
                ],
              ),
              mobile: const Column(
                children: [
                  CommitImageWidget(),
                  CommitTextWidget(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Theme.of(context).primaryColor,
              height: 2,
            ),
            const ContactDetails()
          ],
        ),
      ),
    );
  }
}
