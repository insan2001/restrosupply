import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:restrosupply/constants.dart';

Future<List<Map<String, String>>?> removeImage(String path, String productID,
    String catLocation, List<Map<String, String>> imgData, int index) async {
  Reference fileReference = FirebaseStorage.instance.ref().child(path);

  try {
    imgData.removeAt(index);
    await FirebaseFirestore.instance
        .collection(categoryProducts)
        .doc(productID)
        .update(((index == 0) && imgData.isEmpty)
            ? {
                images: [
                  {images: "", imageStore: ""}
                ]
              }
            : {images: imgData});
    index == 0
        ? await FirebaseFirestore.instance
            .collection(category)
            .doc(catLocation)
            .collection(catLocation)
            .doc(productID)
            .update({images: imgData.isEmpty ? "" : imgData[0][images]})
        : null;

    path == "" ? null : await fileReference.delete();
    return imgData;
  } catch (e) {
    return imgData;
  }
}
