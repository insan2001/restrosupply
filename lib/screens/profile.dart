import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/functions/login.dart';
import 'package:restrosupply/modules/userProvider.dart';
import 'package:restrosupply/routeConstants.dart';
import 'package:restrosupply/widgets/appBar/customScaffold.dart';
import 'package:restrosupply/widgets/body/customImage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  final String id;
  const UserProfileScreen({super.key, required this.id});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  Future<bool> _checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? mail = prefs.getString(email);
    String? password = prefs.getString(passText);

    if (mail != null && password != null) {
      await LoginUser(LoginData(name: mail, password: password), context);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (!context.watch<UserProvider>().login) {
      return Center(
        child: Container(
          color: Colors.amber,
          width: 100,
          height: 50,
          child: TextButton(
              onPressed: () async {
                if (context.read<UserProvider>().login) {
                  context.go(
                      "${RouteConstants().profile}/${context.watch<UserProvider>().uid}");
                } else {
                  if (await _checkUser()) {
                    context.go(
                        "${RouteConstants().profile}/${context.watch<UserProvider>().uid}");
                  } else {
                    context.go(RouteConstants().login);
                  }
                }
              },
              child: Text("Login")),
        ),
      );
    } else if (context.watch<UserProvider>().uid != widget.id) {
      return CustomScaffold(
          body: Center(
              child: Text("you are not authorized to access this page")));
    } else {
      return CustomScaffold(
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Stack(
                    children: [
                      ClipOval(
                        child: CustomImageWidget(
                          path: context.watch<UserProvider>().profileImg,
                          width: 200,
                          height: 200,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            onPressed: () async {
                              late FilePickerResult? result;

                              result = await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ["webp", "png", "jpg"]);

                              if (result != null) {
                                String storagePath =
                                    "$users/${context.read<UserProvider>().uid}/$userProfile";
                                Reference fileReference = FirebaseStorage
                                    .instance
                                    .ref()
                                    .child(storagePath);
                                await fileReference.putData(
                                    result.files.first.bytes!,
                                    SettableMetadata(
                                        contentType:
                                            "image/${result.files.first.extension}"));
                                String url =
                                    await fileReference.getDownloadURL();

                                context.read<UserProvider>().updateProfile(url);

                                try {
                                  await FirebaseFirestore.instance
                                      .collection(users)
                                      .doc(widget.id)
                                      .update({userProfile: url});
                                } catch (e) {
                                  print(e);
                                }
                              } else {
                                // User canceled the picker
                              }
                            },
                            icon: Icon(Icons.add_a_photo)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.watch<UserProvider>().name,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(context).primaryColor,
                        ))
                  ],
                ),
                // Material(
                //     child: Text(
                //         auth.currentUser!.uid)),
                SizedBox(
                  height: 30,
                ),
                Material(
                  child: Text(
                      "Position : ${context.watch<UserProvider>().position}"),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
