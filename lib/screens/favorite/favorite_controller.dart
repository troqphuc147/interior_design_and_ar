import 'package:get/get.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/core/service/database.dart';
import 'package:interior_design_and_ar/core/service/storage.dart';

import '../../core/service/auth.dart';

class FavoriteController extends GetxController with StateMixin {
  final RxList<Product> _listFavorite = <Product>[].obs;
  RxList get listFavorite => _listFavorite;

  AuthService authService = AuthService();
  late DatabaseService database;
  DatabaseService get firebase => database;
  Storage storage = Storage();
  // final RxList<Product> _listManyPopular = <Product>[].obs;
  // final RxList<Product> _listManyNew = <Product>[].obs;
  // RxList get listManyPopular => _listManyPopular;
  // RxList get listManyNew => _listManyNew;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    database = DatabaseService(uid: authService.getCurrentUser?.uid ?? "");
    _listFavorite.value = [];
    // _listManyPopular.value = [];
    // _listManyNew.value = [];
    await loadProduct("All");
  }

  loadProduct(String category) async {
    change(null, status: RxStatus.loading());
    _listFavorite.clear();
    await database
        .getListPopularProduct(category)
        .then((value) => _listFavorite.value = value);
    change(null, status: RxStatus.success());
  }

}
