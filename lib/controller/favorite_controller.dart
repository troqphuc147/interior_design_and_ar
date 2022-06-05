import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/core/service/database.dart';
import '../core/service/auth.dart';

class FavoriteController extends GetxController with StateMixin {
  final RxList<Product> _listFavorite = <Product>[].obs;
  RxList<Product> get listFavorite => _listFavorite;

  final RxList<Product> _listShowedProduct = <Product>[].obs;
  RxList<Product> get listShowedProduct => _listShowedProduct;

  late DatabaseService database;
  DatabaseService get firebase => database;

  final RxString _rating = "All".obs;
  RxString get rating => _rating;
  double _minRating = 1;
  double _maxRating = 5;
  final RxDouble _minCost = 1.0.obs;
  RxDouble get minCost => _minCost;
  final RxDouble _maxCost = 1.0.obs;
  RxDouble get maxCost => _maxCost;
  final RxList<String> _listCategorySelected = <String>[].obs;
  RxList<String> get listCategorySelected => _listCategorySelected;
  final RxString _sortMethodSelected = "".obs;
  RxString get sortMethodSelected => _sortMethodSelected;

  @override
  Future<void> onInit() async {
    super.onInit();
    database =
        DatabaseService(uid: AuthService.instance.getCurrentUser?.uid ?? "");
    _listFavorite.value = [];
    _listShowedProduct.value = [];
    _minCost.value = 0;
    _maxCost.value = 500;
    _listCategorySelected.value = [];
    _sortMethodSelected.value = kListSort[0];
    listCategorySelected.addAll(kListCategory);
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
    filterProduct(_rating.value, RangeValues(_minCost.value, maxCost.value),
        _listCategorySelected);
  }

  addItemsIntoList(Product product) {
    _listFavorite.add(product);
    filterProduct(_rating.value, RangeValues(_minCost.value, maxCost.value),
        _listCategorySelected);
  }

  showWithCategory(String category) {
    _listShowedProduct.clear();
    _listShowedProduct.addAllIf((e) {
      e.nameCategory == category;
    }, _listFavorite);
  }

  updateItemInList(Product product) {
    int index = _listFavorite.indexWhere((element) => element.id == product.id);
    if (index < 0) {
      return;
    }
    List<Product> list = [product];
    _listFavorite.replaceRange(index - 1, index, list);
  }

  filterProduct(
      String rating, RangeValues rangeCostValues, List<String> category) {
    _minCost.value = rangeCostValues.start;
    _maxCost.value = rangeCostValues.end;
    _rating.value = rating;
    List<String> ctgr = [];
    ctgr.addAll(category);
    _listCategorySelected.clear();
    _listCategorySelected.addAll(ctgr);
    _listShowedProduct.clear();
    setRatingValue(rating);
    for (int i = 0; i < listFavorite.length; i++) {
      if (double.parse(listFavorite[i].rating) >= _minRating &&
          double.parse(listFavorite[i].rating) <= _maxRating &&
          double.parse(listFavorite[i].cost) >= _minCost.value &&
          double.parse(listFavorite[i].cost) <= _maxCost.value &&
          _listCategorySelected.contains(listFavorite[i].nameCategory)) {
        _listShowedProduct.add(listFavorite[i]);
      }
    }
    sort(_sortMethodSelected.value);
  }

  void setRatingValue(String rating) {
    if (rating == kListRating[0]) {
      _maxRating = 5;
      _minRating = 1;
    } else if (rating == kListRating[1]) {
      _maxRating = 5;
      _minRating = 4.5;
    } else if (rating == kListRating[2]) {
      _maxRating = 4.4;
      _minRating = 3.6;
    } else if (rating == kListRating[1]) {
      _maxRating = 3.5;
      _minRating = 2.6;
    } else if (rating == kListRating[1]) {
      _maxRating = 2.5;
      _minRating = 2.0;
    } else if (rating == kListRating[1]) {
      _maxRating = 2.0;
      _minRating = 1.0;
    }
  }

  sortDefault() {
    _listShowedProduct.clear();
    for (int i = 0; i < listFavorite.length; i++) {
      if (double.parse(listFavorite[i].rating) >= _minRating &&
          double.parse(listFavorite[i].rating) <= _maxRating &&
          double.parse(listFavorite[i].cost) >= _minCost.value &&
          double.parse(listFavorite[i].cost) <= _maxCost.value &&
          _listCategorySelected.contains(listFavorite[i].nameCategory)) {
        _listShowedProduct.add(listFavorite[i]);
      }
    }
  }

  sortByCostAscending() {
    _listShowedProduct
        .sort((a, b) => double.parse(a.cost).compareTo(double.parse(b.cost)));
  }

  sortByCostDescending() {
    _listShowedProduct
        .sort((a, b) => double.parse(b.cost).compareTo(double.parse(a.cost)));
  }

  sortByRatingAscending() {
    _listShowedProduct.sort(
        (a, b) => double.parse(a.rating).compareTo(double.parse(b.rating)));
  }

  sortByRatingDescending() {
    _listShowedProduct.sort(
        (a, b) => double.parse(b.rating).compareTo(double.parse(a.rating)));
  }

  sort(String method) {
    _sortMethodSelected.value = method;
    if (method == kListSort[1]) {
      sortByCostAscending();
    } else if (method == kListSort[2]) {
      sortByCostDescending();
    } else if (method == kListSort[3]) {
      sortByRatingAscending();
    } else if (method == kListSort[4]) {
      sortByRatingDescending();
    } else {
      sortDefault();
    }
  }

  List<String> getListOption(List<Product> listProduct) {
    List<String> listOptions = [];
    for (int i = 0; i < listProduct.length; i++) {
      listOptions.add(listProduct[i].name);
    }
    return listOptions;
  }
}
