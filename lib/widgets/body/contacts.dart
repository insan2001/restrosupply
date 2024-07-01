import 'package:flutter/material.dart';
import 'package:restrosupply/modules/adaptive.dart';
import 'package:url_launcher/url_launcher.dart';

final List<String> addr = [
  "349 Bowes Rd #21,",
  "Concord,",
  "ON",
  "L4K 1J3",
];

final List<String> contacts = [
  "Email: sales@safegreen.ca",
  "             jay@safegreen.ca",
  "Phone: +1-905.761.1551",
  "             +1-647-762-2196",
];

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Our address:",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(
                      addr.length,
                      (index) => Text(addr[index],
                          style: Theme.of(context).textTheme.labelLarge)),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get in Touch",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(
                    contacts.length,
                    (index) => Text(contacts[index],
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  launchUrl(Uri.parse("https://insan2001.github.io/"));
                },
                child: Text("<dev>")),
            isDevice(
              desktop: SizedBox(
                width: MediaQuery.of(context).size.width / 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
