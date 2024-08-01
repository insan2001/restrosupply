import 'package:firebase_storage/firebase_storage.dart';

/// reference path
void deleteImg(String path) async {
  try {
    Reference fileReference = FirebaseStorage.instance.ref().child(path);
    await fileReference.delete();
  } catch (_) {}
}
