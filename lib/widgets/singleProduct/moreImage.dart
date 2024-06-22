import 'package:flutter/material.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/widgets/body/customImage.dart';

class SuggestWidget extends StatefulWidget {
  final int index;
  final List<List<dynamic>> productsData;
  const SuggestWidget(
      {super.key, required this.index, required this.productsData});

  @override
  State<SuggestWidget> createState() => _SuggestWidgetState();
}

class _SuggestWidgetState extends State<SuggestWidget> {
  late final String title;
  late final String image;

  @override
  void initState() {
    title = widget.productsData[widget.index][textIndex];
    image = widget.productsData[widget.index][imageIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
}
