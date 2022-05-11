import 'package:get/get.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/core/service/database.dart';
import 'package:interior_design_and_ar/core/service/storage.dart';

import '../core/service/auth.dart';

class MainController extends GetxController with StateMixin {
  final RxList<Product> _listPopular = <Product>[].obs;
  final RxList<Product> _listNew = <Product>[].obs;
  RxList get listPopular => _listPopular;
  RxList get listNew => _listNew;

  AuthService authService = AuthService();
  late DatabaseService database;
  DatabaseService get firebase => database;
  Storage storage = Storage();

  final RxList<Product> _listManyPopular = <Product>[].obs;
  final RxList<Product> _listManyNew = <Product>[].obs;
  RxList get listManyPopular => _listManyPopular;
  RxList get listManyNew => _listManyNew;

  final RxList<String> _listFavoriteId = <String>[].obs;
  RxList get listFavoriteId => _listFavoriteId;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    database = DatabaseService(uid: authService.getCurrentUser?.uid ?? "");
    _listNew.value = [];
    _listPopular.value = [];
    _listManyPopular.value = [];
    _listManyNew.value = [];
    _listFavoriteId.value = [];
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
    change(null, status: RxStatus.success());
  }

  loadPopularProducts(String category) async {
    change(null, status: RxStatus.loading());
    _listManyPopular.clear();
    await database
        .loadPopularProducts(category)
        .then((v) => _listManyPopular.value = v);
    change(null, status: RxStatus.success());
  }

  loadNewProducts(String category) async {
    change(null, status: RxStatus.loading());
    _listManyNew.clear();
    await database
        .loadNewProducts(category)
        .then((v) => _listManyNew.value = v);
    change(null, status: RxStatus.success());
  }

  ratingProduct(Product product, int rate) async {
    if (_listPopular
        .where((element) => element.id == product.id)
        .toList()
        .isNotEmpty) {
      _listPopular.firstWhere((element) => element.id == product.id).rating =
          product.rating;
      _listPopular.firstWhere((element) => element.id == product.id).numVote =
          product.numVote;
      print('set in pp');
    }
    if (_listNew
        .where((element) => element.id == product.id)
        .toList()
        .isNotEmpty) {
      _listNew.firstWhere((element) => element.id == product.id).rating =
          product.rating;
      _listNew.firstWhere((element) => element.id == product.id).numVote =
          product.numVote;
      print('set in  new');
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
      print('set in many pp');
    }
    if (_listManyNew
        .where((element) => element.id == product.id)
        .toList()
        .isNotEmpty) {
      _listManyNew.firstWhere((element) => element.id == product.id).rating =
          product.rating;
      _listManyNew.firstWhere((element) => element.id == product.id).numVote =
          product.numVote;
      print('set in many new');
    }
    update();
    await database.rating(product, rate);
  }

  getListFavoriteId() {
    firebase
        .getListFavoriteProductId()
        .then((value) => value.toList().forEach((element) {
          _listFavoriteId.add(element);
    }));
  }
  addToFavoriteList(String productId)
  async {
    _listFavoriteId.add(productId);
    await firebase
        .likeProduct(productId);
  }
  deleteInFavoriteList(String productId)
  async {
    _listFavoriteId.remove(productId);
    await firebase
        .unLikeProduct(productId);
  }
}
