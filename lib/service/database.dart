import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interior_design_and_ar/core/models/product.dart';

class DatabaseService{
  final String uid;
  DatabaseService({
    required this.uid,
  });
  final CollectionReference users =
  FirebaseFirestore.instance.collection('users');
  final CollectionReference products =
  FirebaseFirestore.instance.collection('products');
  final CollectionReference categories =
  FirebaseFirestore.instance.collection('categories');
  //start========Product==============
  Future<List<Product>> getListProduct()
  async {
    List<Product> listProduct = [];
    await products.get().then((value) => value.docs.toList().forEach((element) {
      listProduct.add(Product.fromMap(element.data() as Map<String, dynamic>));
    }));
    return listProduct;
  }
//end==========Product==============
}