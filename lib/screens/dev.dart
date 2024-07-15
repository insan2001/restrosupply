import 'package:flutter/material.dart';
import 'package:restrosupply/widgets/circleImage.dart';
import 'package:url_launcher/url_launcher.dart';

class DevScreen extends StatelessWidget {
  const DevScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        width: 400,
        child: Column(
          children: [
            const CircleImage(
              path: "assets/images/dev.jpg",
              size: 200,
            ),
            Row(
              children: [
                Wrap(children: [
                  Text(
                    "Insan\nJeyakkumar",
                    style: Theme.of(context).textTheme.displayMedium,
                    maxLines: 2,
                  ),
                ]),
                InkWell(
                  onTap: () => launchUrl(
                    Uri.parse("https://github.com/insan2001"),
                  ),
                  child: CircleAvatar(
                    foregroundImage: Image.asset("assets/images/git.png").image,
                    backgroundColor: Colors.black,
                    radius: 40,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
