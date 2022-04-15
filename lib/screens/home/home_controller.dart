import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/core/service/database.dart';
import 'package:interior_design_and_ar/core/service/storage.dart';

class HomeControler extends GetxController with StateMixin {
  List<Product> _listPopular = [];
  List<Uint8List> _listPopularImage = [];
  List<Product> _listNew = [];
  List<Uint8List> _listNewImage = [];
  DatabaseService database = DatabaseService(uid: "");
  Storage storage = Storage();
  List<Product> get listPopular => _listPopular;
  List<Product> get listNew => _listNew;
  List<Uint8List> get listPopularImage => _listPopularImage;
  List<Uint8List> get listNewImage => _listNewImage;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    _listNew.clear();
    _listNewImage.clear();
    _listPopularImage.clear();
    _listPopular.clear();
    await loadProduct();
  }

  loadImage() async {
    await storage
        .loadListImages(_listPopular)
        .then((value) => _listPopularImage = value);
    await storage
        .loadListImages(_listNew)
        .then((value) => _listNewImage = value);
  }

  loadProduct() async {
    change(null, status: RxStatus.loading());
    await database
        .getListPopularProduct("All")
        .then((value) => _listPopular = value);
    await database.getListNewProduct("All").then((value) => _listNew = value);
    change(null, status: RxStatus.success());
  }
}
