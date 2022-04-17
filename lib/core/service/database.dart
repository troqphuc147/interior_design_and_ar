import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interior_design_and_ar/core/models/product.dart';

class DatabaseService {
  final String uid;
  DatabaseService({
    required this.uid,
  });
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference products =
      FirebaseFirestore.instance.collection('Products');
  final CollectionReference categories =
      FirebaseFirestore.instance.collection('Categories');
  //start========Product==============
  Future<List<Product>> getListProduct() async {
    List<Product> listProduct = [];
    await products.get().then((value) => value.docs.toList().forEach((element) {
          listProduct
              .add(Product.fromMap(element.data() as Map<String, dynamic>));
        }));
    return listProduct;
  }

  Future<List<Product>> getListPopularProduct(String category) async {
    List<Product> listProduct = [];
    if (category == "All") {
      await products
          .orderBy('numVote', descending: true)
          .limit(5)
          .get()
          .then((value) => value.docs.toList().forEach((element) {
            print(element.data());
                listProduct.add(Product.fromMap(element.data() as Map<String, dynamic>));
              }));
    } else {
      await products
          .where("nameCategory", isEqualTo: category)
          .orderBy("numVote", descending: true)
          .limit(5)
          .get()
          .then((value) => value.docs.toList().forEach((element) {
                listProduct.add(
                    Product.fromMap(element.data() as Map<String, dynamic>));
              }));
    }
    return listProduct;
  }

  Future<List<Product>> getListNewProduct(String category) async {
    List<Product> listProduct = [];
    if (category == "All") {
      await products
          .orderBy("idImage", descending: true)
          .limit(5)
          .get()
          .then((value) => value.docs.toList().forEach((element) {
                listProduct.add(
                    Product.fromMap(element.data() as Map<String, dynamic>));
              }));
    } else {
      await products
          .where("nameCategory", isEqualTo: category)
          .orderBy("idImage", descending: true)
          .limit(5)
          .get()
          .then((value) => value.docs.toList().forEach((element) {
                listProduct.add(
                    Product.fromMap(element.data() as Map<String, dynamic>));
              }));
    }
    return listProduct;
  }
  //end==========Product==============
}
