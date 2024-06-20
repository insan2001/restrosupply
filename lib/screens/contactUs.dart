import 'package:flutter/material.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';

final List<String> detail1 = ["349 Bowes Rd #21,", "Concord,", "ON. L4K 1J3"];
final List<String> detail2 = [
  "+1-905.761.1551",
  "+1-647-762-2196",
];
final List<String> detail3 = [
  "Monday 09:00 AM",
  "Friday 05:00 PM",
];

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Text(
            "Contact Us",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 30,
                      color: Color.fromARGB(255, 2, 237, 10),
                    ),
                    Text(
                      "Toronto",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      detail1.length,
                      (index) => Text(
                            detail1[index],
                            style: Theme.of(context).textTheme.labelLarge,
                          )),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(
                      Icons.phone_android,
                      size: 30,
                      color: Color.fromARGB(255, 2, 237, 10),
                    ),
                    Text(
                      "Call us on",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      detail2.length,
                      (index) => Text(
                            detail2[index],
                            style: Theme.of(context).textTheme.labelLarge,
                          )),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(
                      Icons.work,
                      size: 30,
                      color: Color.fromARGB(255, 2, 237, 10),
                    ),
                    Text(
                      "Working hours",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      detail3.length,
                      (index) => Text(
                            detail3[index],
                            style: Theme.of(context).textTheme.labelLarge,
                          )),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(
                      Icons.email,
                      size: 25,
                      color: Color.fromARGB(255, 2, 237, 10),
                    ),
                    Text(
                      "sales@safegreen.ca",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(
                      Icons.email,
                      size: 25,
                      color: Color.fromARGB(255, 2, 237, 10),
                    ),
                    Text(
                      "jay@safegreen.ca",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
