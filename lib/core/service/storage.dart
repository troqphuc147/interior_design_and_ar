import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../models/product.dart';

class Storage {
  Future uploadFileToFirebase(File _file) async {
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('Files/${_file.path}');
    firebase_storage.UploadTask uploadTask = storageReference.putFile(_file);
    await uploadTask.whenComplete(() => print('uploaded file'));
  }

  Future<List<Uint8List>> loadListImages(List<Product> products) async {
    List<Uint8List> list = [];
    for (int i = 0; i < products.length; i++) {
      loadImages(products[i].linkImage).then((value) => list.add(value));
    }
    return list;
  }

  Future<Uint8List> loadImages(String path) async {
    path = path;
    final firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref().child(path);
    var url;
    await ref.getData().then((value) => url = value);
    print("Loaded image");
    return url;
  }

  Future deleteImages(String path) async {
    path = 'images' + path;
    final firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref().child(path);
    await ref.delete();
  }
}
