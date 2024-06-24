import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:restrosupply/constants.dart';
import 'package:restrosupply/data.dart';

Future<String> uploadFile(String fileName) async {
  // Pick a file
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    // Get the file
    var file = result.files.first.bytes;
    String extension = result.files.first.extension!;

    // Upload the file to Firebase Storage
    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child("images/$fileName.$extension");

      UploadTask uploadTask = storageReference.putData(file!);
      await uploadTask;

      String downloadUrl = await storageReference.getDownloadURL();
      List<String> details = fileName.split("-");
      try {
        dataList[categoryId[details[0]]]![data]![int.parse(details[1])]
            [imageIndex] = downloadUrl;
      } catch (e) {}
      return downloadUrl;
    } catch (e) {
      return e.toString();
    }
  } else {
    return "Cancelled";
  }
}
