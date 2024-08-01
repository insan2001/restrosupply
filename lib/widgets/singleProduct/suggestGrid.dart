import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/common/error.dart';
import 'package:restrosupply/widgets/common/waiting.dart';
import 'package:restrosupply/widgets/singleProduct/moreImage.dart';

class SuggestGridWidget extends StatefulWidget {
  const SuggestGridWidget({super.key});

  @override
  State<SuggestGridWidget> createState() => _SuggestGridWidgetState();
}

class _SuggestGridWidgetState extends State<SuggestGridWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05),
      child: FutureBuilder(
          future: FirebaseFirestore.instance.collection(categoryProducts).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return WaitingWidget();
            } else if (snapshot.hasError) {
              return LoadingErrorWidget();
            } else {
              // Map<String, dynamic>
              List<String> ids =
                  snapshot.data!.docs.map((doc) => doc.id).toList();
              ids.shuffle();
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        MediaQuery.of(context).size.width > mobileWidth ? 4 : 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.8),
                shrinkWrap: true,
                itemCount: ids.length < 8 ? ids.length : 8,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.go("${RouteConstants().product}/${ids[index]}");
                  },
                  child: SuggestWidget(
                    productID: ids[index],
                  ),
                ),
              );
            }
          }),
    );
  }
}
