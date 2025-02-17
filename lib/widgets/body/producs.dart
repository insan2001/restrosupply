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
              return Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    CustomImageWidget(
                      path: data[categoryImage],
                      width: MediaQuery.of(context).size.width >= mobileWidth
                          ? MediaQuery.of(context).size.width / 10
                          : MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width >= mobileWidth
                          ? MediaQuery.of(context).size.width / 10
                          : MediaQuery.of(context).size.width * 0.4,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 25,
                      child: Text(
                        data[categoryName],
                        style: MediaQuery.of(context).size.width >= mobileWidth
                            ? Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontSize: 14)
                            : Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
