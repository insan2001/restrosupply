import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/widgets/body/customImage.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';

class ProductsInfo extends StatelessWidget {
  final String id;
  const ProductsInfo({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width > mobileWidth
          ? MediaQuery.of(context).size.width / 8
          : MediaQuery.of(context).size.width * 0.4,
      child: FutureBuilder(
          future: FirebaseFirestore.instance.collection(category).doc(id).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return WaitingWidget();
            } else if (snapshot.hasError) {
              return LoadingErrorWidget();
            } else {
              Map<String, dynamic> data = snapshot.data!.data()!;
              return Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: CustomImageWidget(
                      path: data[categoryImage],
                      width: MediaQuery.of(context).size.width >= mobileWidth
                          ? MediaQuery.of(context).size.width / 7.5
                          : MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width >= mobileWidth
                          ? MediaQuery.of(context).size.width / 7.5
                          : MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 45,
                    child: Text(
                      data[categoryName],
                      style: MediaQuery.of(context).size.width >= mobileWidth
                          ? Theme.of(context).textTheme.labelMedium
                          : Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 20),
                      maxLines: 3,
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
