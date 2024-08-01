import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/widgets/body/customImage.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';

class SuggestWidget extends StatefulWidget {
  final String productID;
  const SuggestWidget({super.key, required this.productID});

  @override
  State<SuggestWidget> createState() => _SuggestWidgetState();
}

class _SuggestWidgetState extends State<SuggestWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection(categoryProducts)
            .doc(widget.productID)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return WaitingWidget();
          } else if (snapshot.hasError) {
            return LoadingErrorWidget();
          } else {
            Map<String, dynamic> data = snapshot.data!.data()!;
            String title = data[titlee];
            String image = data[images][0][images];
            return Container(
              width: MediaQuery.of(context).size.width * 0.2 * 0.8,
              height: MediaQuery.of(context).size.width * 0.2,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CustomImageWidget(
                      path: image,
                      height: MediaQuery.of(context).size.width > mobileWidth
                          ? MediaQuery.of(context).size.width * 0.2
                          : MediaQuery.of(context).size.width * 0.8,
                      width: MediaQuery.of(context).size.width > mobileWidth
                          ? MediaQuery.of(context).size.width * 0.2
                          : MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.01),
                  ),
                  const Spacer(),
                ],
              ),
            );
          }
        });
  }
}
