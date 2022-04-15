import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/core/service/database.dart';
import 'package:interior_design_and_ar/core/service/storage.dart';

class HomeControler extends GetxController with StateMixin {
  List<Product> _listPopular = [];
  List<Product> _listNew = [];
  DatabaseService database = DatabaseService(uid: "");
  Storage storage = Storage();
  List<Product> get listPopular => _listPopular;
  List<Product> get listNew => _listNew;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await loadProduct("All");
  }
  loadProduct(String category) async {
    change(null, status: RxStatus.loading());
    _listNew.clear();
    _listPopular.clear();
    await database
        .getListPopularProduct(category)
        .then((value) => _listPopular = value);
    await database.getListNewProduct(category).then((value) => _listNew = value);
    change(null, status: RxStatus.success());
  }
}
