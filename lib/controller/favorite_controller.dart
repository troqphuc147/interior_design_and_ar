import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/core/models/category.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/core/service/database.dart';

import '../core/service/auth.dart';

class FavoriteController extends GetxController with StateMixin {
  final RxList<Product> _listFavorite = <Product>[].obs;
  RxList get listFavorite => _listFavorite;

  final RxList<Product> _listShowedProduct = <Product>[].obs;
  RxList get listShowedProduct => _listShowedProduct;

  AuthService authService = AuthService();
  late DatabaseService database;
  DatabaseService get firebase => database;

  @override
  Future<void> onInit() async {
    super.onInit();
    database = DatabaseService(uid: authService.getCurrentUser?.uid ?? "");
    _listFavorite.value = [];
    _listShowedProduct.value = [];
    await loadProduct();
  }

  loadProduct() async {
    change(null, status: RxStatus.loading());
    _listFavorite.clear();
    await firebase.getListFavoriteProduct().then((value) => {
          _listFavorite.value = value,
          _listShowedProduct.value.addAll(value),
        });
    change(null, status: RxStatus.success());
  }

  deleteItemsInList(Product product) {
    _listFavorite.removeWhere((element) => element.id == product.id);
    _listShowedProduct.removeWhere((element) => element.id == product.id);
  }

  addItemsIntoList(Product product) {
    _listFavorite.add(product);
    _listShowedProduct.add(product);
  }

  showWithCategory(String category) {
    _listShowedProduct.clear();
    _listShowedProduct.addAllIf((e) {
      e.nameCategory == category;
    }, _listFavorite);
  }

  updateItemInList(Product product) {
    int index = _listFavorite.indexWhere((element) => element.id == product.id);
    _listFavorite.removeAt(index);
    _listFavorite.insert(index, product);
  }

  filterProduct(
      String rating, RangeValues rangeCostValues, List<String> category) {
    double maxRating = 0;
    double minRating = 0;
    if (rating == kListRating[0]) {
      maxRating = 5;
      minRating = 1;
    } else if (rating == kListRating[1]) {
      maxRating = 5;
      minRating = 4.5;
    } else if (rating == kListRating[2]) {
      maxRating = 4.4;
      minRating = 3.6;
    } else if (rating == kListRating[1]) {
      maxRating = 3.5;
      minRating = 2.6;
    } else if (rating == kListRating[1]) {
      maxRating = 2.5;
      minRating = 2.0;
    } else if (rating == kListRating[1]) {
      maxRating = 2.0;
      minRating = 1.0;
    }

    listShowedProduct.clear();
    for (int i = 0; i < listFavorite.length; i++) {
      if (double.parse(listFavorite[i].rating) >= minRating &&
          double.parse(listFavorite[i].rating) <= maxRating &&
          double.parse(listFavorite[i].cost) >= rangeCostValues.start &&
          double.parse(listFavorite[i].cost) <= rangeCostValues.end &&
          category.contains(listFavorite[i].nameCategory)) {
        listShowedProduct.add(listFavorite[i]);
      }
    }
  }
}
