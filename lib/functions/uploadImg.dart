import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:restrosupply/constants.dart';

Future<List<Map<String, String>>> addImage(String productID, String catLocation,
    List<Map<String, String>> imgData, int index) async {
  late FilePickerResult? result;

  result = await FilePicker.platform.pickFiles(
      type: FileType.custom, allowedExtensions: ["webp", "png", "jpg"]);

  if (result != null) {
    String ref = "$storageImage/$productID/${result.files.first.name}";
    Reference fileReference = FirebaseStorage.instance.ref().child(ref);
    try {
      await fileReference.putData(result.files.first.bytes!);
      String url = await fileReference.getDownloadURL();
      try {
        if (index < imgData.length) {
          imgData.removeAt(index);
          imgData.insert(index, {images: url, imageStore: ref});
        } else {
          imgData.add({images: url, imageStore: ref});
        }
        await FirebaseFirestore.instance
            .collection(categoryProducts)
            .doc(productID)
            .update({
          images: imgData,
        });
        Map<String, String> newData = {images: url, imageStore: ref};
        imgData[index] = newData;
        index == 0
            ? await FirebaseFirestore.instance
                .collection(category)
                .doc(catLocation)
                .collection(catLocation)
                .doc(productID)
                .update({images: url})
            : null;
        return imgData;
      } catch (_) {
        return imgData;
      }
    } catch (e) {
      return imgData;
    }
  } else {
    return imgData;
  }
}
