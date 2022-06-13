import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/core/service/database.dart';
import 'package:interior_design_and_ar/core/service/storage.dart';

import '../constants.dart';
import '../core/service/auth.dart';

class MainController extends GetxController with StateMixin {
  final RxList<Product> _listPopular = <Product>[].obs;
  final RxList<Product> _listNew = <Product>[].obs;
  RxList get listPopular => _listPopular;
  RxList get listNew => _listNew;
  final RxList<String> _listOption = <String>[].obs;
  RxList<String> get listOption => _listOption;

  late DatabaseService database;
  DatabaseService get firebase => database;
  Storage storage = Storage();

  final RxList<Product> _listManyPopular = <Product>[].obs;
  final RxList<Product> _listManyNew = <Product>[].obs;
  final RxList<Product> _listManyShowedPopular = <Product>[].obs;
  final RxList<Product> _listManyShowedNew = <Product>[].obs;
  RxList<Product> get listManyPopular => _listManyPopular;
  RxList<Product> get listManyNew => _listManyNew;
  RxList<Product> get listManyShowedPopular => _listManyShowedPopular;
  RxList<Product> get listManyShowedNew => _listManyShowedNew;

  final RxList<String> _listFavoriteId = <String>[].obs;
  RxList get listFavoriteId => _listFavoriteId;

  @override
  Future<void> onInit() async {
    super.onInit();
    database =
        DatabaseService(uid: AuthService.instance.getCurrentUser?.uid ?? "");
    _listNew.value = [];
    _listPopular.value = [];
    _listManyPopular.value = [];
    _listManyNew.value = [];
    _listFavoriteId.value = [];
    _listManyShowedNew.value = [];
    _listManyShowedPopular.value = [];
    _listOption.value = [];
    await getListFavoriteId();
    await loadProduct("All");
  }

  loadProduct(String category) async {
    change(null, status: RxStatus.loading());
    _listNew.clear();
    _listPopular.clear();
    await database
        .getListPopularProduct(category)
        .then((value) => _listPopular.value = value);
    await database
        .getListNewProduct(category)
        .then((value) => _listNew.value = value);
    for (var element in _listNew) {
      if (!_listOption.contains(element.name.toLowerCase())) {
        _listOption.add(element.name.toLowerCase());
      }
    }
    for (var element in _listPopular) {
      if (!_listOption.contains(element.name.toLowerCase())) {
        _listOption.add(element.name.toLowerCase());
      }
    }
    change(null, status: RxStatus.success());
  }

  loadPopularProducts(String category) async {
    change(null, status: RxStatus.loading());
    _listManyPopular.clear();
    _listManyShowedPopular.clear();

    await database
        .loadPopularProducts(category)
        .then((v) => _listManyPopular.value = v);
    _listManyShowedPopular.addAll(_listManyPopular);

    change(null, status: RxStatus.success());
    for (var element in _listManyPopular) {
      if (!_listOption.contains(element.name.toLowerCase())) {
        _listOption.add(element.name.toLowerCase());
      }
    }
  }

  loadNewProducts(String category) async {
    change(null, status: RxStatus.loading());
    _listManyNew.clear();
    _listManyShowedNew.clear();
    await database
        .loadNewProducts(category)
        .then((v) => _listManyNew.value = v);
    _listManyShowedNew.addAll(_listManyNew);
    change(null, status: RxStatus.success());
    change(null, status: RxStatus.success());
    for (var element in _listManyNew) {
      if (!_listOption.contains(element.name.toLowerCase())) {
        _listOption.add(element.name.toLowerCase());
      }
    }
  }

  ratingProduct(Product product, int rate) async {
    if (_listManyShowedPopular
        .where((element) => element.id == product.id)
        .toList()
        .isNotEmpty) {
      _listManyShowedPopular
          .firstWhere((element) => element.id == product.id)
          .rating = product.rating;
      _listManyShowedPopular
          .firstWhere((element) => element.id == product.id)
          .numVote = product.numVote;
    }
    if (_listManyShowedNew
        .where((element) => element.id == product.id)
        .toList()
        .isNotEmpty) {
      _listManyShowedNew
          .firstWhere((element) => element.id == product.id)
          .rating = product.rating;
      _listManyShowedNew
          .firstWhere((element) => element.id == product.id)
          .numVote = product.numVote;
    }
    if (_listPopular
        .where((element) => element.id == product.id)
        .toList()
        .isNotEmpty) {
      _listPopular.firstWhere((element) => element.id == product.id).rating =
          product.rating;
      _listPopular.firstWhere((element) => element.id == product.id).numVote =
          product.numVote;
    }
    if (_listNew
        .where((element) => element.id == product.id)
        .toList()
        .isNotEmpty) {
      _listNew.firstWhere((element) => element.id == product.id).rating =
          product.rating;
      _listNew.firstWhere((element) => element.id == product.id).numVote =
          product.numVote;
    }
    if (_listManyPopular
        .where((element) => element.id == product.id)
        .toList()
        .isNotEmpty) {
      _listManyPopular
          .firstWhere((element) => element.id == product.id)
          .rating = product.rating;
      _listManyPopular
          .firstWhere((element) => element.id == product.id)
          .numVote = product.numVote;
    }
    if (_listManyNew
        .where((element) => element.id == product.id)
        .toList()
        .isNotEmpty) {
      _listManyNew.firstWhere((element) => element.id == product.id).rating =
          product.rating;
      _listManyNew.firstWhere((element) => element.id == product.id).numVote =
          product.numVote;
    }
    update();
    await database.rating(product, rate);
  }

  getListFavoriteId() {
    database
        .getListFavoriteProductId()
        .then((value) => value.toList().forEach((element) {
              _listFavoriteId.add(element);
            }));
  }

  addToFavoriteList(String productId) async {
    _listFavoriteId.add(productId);
    await database.likeProduct(productId);
  }

  deleteInFavoriteList(String productId) async {
    _listFavoriteId.remove(productId);
    await database.unLikeProduct(productId);
  }

  filterNewProduct(
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

    _listManyShowedNew.clear();
    for (int i = 0; i < _listManyNew.length; i++) {
      if (double.parse(_listManyNew[i].rating) >= minRating &&
          double.parse(_listManyNew[i].rating) <= maxRating &&
          double.parse(_listManyNew[i].cost) >= rangeCostValues.start &&
          double.parse(_listManyNew[i].cost) <= rangeCostValues.end &&
          category.contains(_listManyNew[i].nameCategory)) {
        _listManyShowedNew.add(_listManyNew[i]);
      }
    }
  }

  Product getSeachedProduct(String name) {
    name = name.toLowerCase();
    Product rs = Product(
        id: "",
        idCategory: "",
        name: "",
        nameCategory: "",
        description: "",
        rating: "",
        idImage: 0,
        linkAr: "",
        linkImage: "",
        numVote: "",
        cost: "");
    rs = _listNew.firstWhere((element) => element.name.toLowerCase() == name,
        orElse: () => rs);
    if (rs.id == "") {
      rs = _listPopular.firstWhere(
          (element) => element.name.toLowerCase() == name,
          orElse: () => rs);
    }
    if (rs.id == "") {
      rs = _listManyNew.firstWhere(
          (element) => element.name.toLowerCase() == name,
          orElse: () => rs);
    }
    if (rs.id == "") {
      rs = _listManyPopular.firstWhere(
          (element) => element.name.toLowerCase() == name,
          orElse: () => rs);
    }
    return rs;
  }

  List<String> getListOption(List<Product> listProduct) {
    List<String> listOptions = [];
    for (int i = 0; i < listProduct.length; i++) {
      listOptions.add(listProduct[i].name);
    }
    return listOptions;
  }
}
