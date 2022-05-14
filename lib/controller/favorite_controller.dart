import 'package:get/get.dart';
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
          _listShowedProduct.value = value,
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
}
