import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  Future uploadFileToFirebase(File _file) async {
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('Files/${_file.path}');
    firebase_storage.UploadTask uploadTask =
    storageReference.putFile(_file);
    await uploadTask.whenComplete(() => print('uploaded file'));
  }

  Future<Uint8List> loadImages(String path) async {
    path = 'images' + path;
    final firebase_storage.Reference ref =
    firebase_storage.FirebaseStorage.instance.ref().child(path);
    var url;
    await ref
        .getData()
        .then((value) => url = value);
    return url;
  }

  Future deleteImages(String path) async {
    path = 'images' + path;
    final firebase_storage.Reference ref =
    firebase_storage.FirebaseStorage.instance.ref().child(path);
    await ref.delete();
  }
}