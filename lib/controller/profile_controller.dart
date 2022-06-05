import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/core/models/rating.dart';

import '../core/service/auth.dart';
import '../core/service/database.dart';

class ProfileController extends GetxController with StateMixin {
  final RxList<Product> _listRatingProduct = <Product>[].obs;
  RxList<Product> get listRatingProduct => _listRatingProduct;
  final RxList<Rating> _listRating = <Rating>[].obs;
  RxList<Rating> get listRating => _listRating;
  late DatabaseService database;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    database =
        DatabaseService(uid: AuthService.instance.getCurrentUser?.uid ?? "");
    getListRatingProduct();
  }

  Future<void> getListRatingProduct() async {
    change(null, status: RxStatus.loading());
    await database.getListRating().then((v) => _listRating.value = v);
    List<String> listId = [];
    for (int i = 0; i < _listRating.length; i++) {
      listId.add(_listRating[i].idProduct);
    }
    await database
        .getListProductById(listId)
        .then((value) => _listRatingProduct.value = value);
    change(null, status: RxStatus.success());
  }

  void addRating(Product product, int star) {
    _listRating.add(Rating(idProduct: product.id, star: star));
    _listRatingProduct.add(product);
  }
}
