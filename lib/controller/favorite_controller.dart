import 'package:get/get.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/core/service/database.dart';
import 'package:interior_design_and_ar/core/service/storage.dart';

import '../core/service/auth.dart';

class FavoriteController extends GetxController with StateMixin {
  final RxList<Product> _listFavorite = <Product>[].obs;
  RxList get listFavorite => _listFavorite;

  final RxList<Product> _listShowedProduct = <Product>[].obs;
  RxList get lostShowedProduct => _listShowedProduct;

  AuthService authService = AuthService();
  late DatabaseService database;
  DatabaseService get firebase => database;
  Storage storage = Storage();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    database = DatabaseService(uid: authService.getCurrentUser?.uid ?? "");
    _listFavorite.value = [];
    await loadProduct();
  }

  loadProduct() async {
    change(null, status: RxStatus.loading());
    _listFavorite.clear();
    firebase
        .getListFavoriteProduct()
        .then((value) => _listFavorite.value = value);
    _listShowedProduct.value = _listFavorite;
    change(null, status: RxStatus.success());
  }

  showWithCategory(String category)
  {
    _listShowedProduct.clear();
    _listShowedProduct.addAllIf((e){
      e.nameCategory == category;
    }, _listFavorite);
  }
}
