import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/core/models/rating.dart';

import '../models/vote.dart';

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

  //TODO implement getListPopularProduct
  Future<List<Product>> getListPopularProduct(String category) async {
    List<Product> listProduct = [];
    if (category == "All") {
      await products
          .orderBy('numVote', descending: true)
          .limit(5)
          .get()
          .then((value) => value.docs.toList().forEach((element) {
                listProduct.add(
                    Product.fromMap(element.data() as Map<String, dynamic>));
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

  Future<Rating> checkUserVoted(String idProduct) async {
    Rating voted = Rating(idProduct: idProduct, star: 0);
    await users
        .doc(uid)
        .collection("Voted")
        .get()
        .then((value) => value.docs.toList().forEach((element) {
              Rating rating = Rating.fromMap(element.data());
              if (rating.idProduct == idProduct) {
                voted.star = rating.star;
              }
            }));
    return voted;
  }

  Future<void> rating(Product product, int star) async {
    Rating rating = Rating(idProduct: product.id, star: star);
    await users.doc(uid).collection("Voted").add(rating.toMap());
    await products.doc(product.id).update(product.toMap());
  }

  Future<List<Product>> loadPopularProducts(String category) async {
    List<Product> listProduct = [];
    if (category == "All") {
      await products
          .orderBy('numVote', descending: true)
          .limit(16)
          .get()
          .then((value) => value.docs.toList().forEach((element) {
                listProduct.add(
                    Product.fromMap(element.data() as Map<String, dynamic>));
              }));
    } else {
      await products
          .where("nameCategory", isEqualTo: category)
          .orderBy("numVote", descending: true)
          .limit(10)
          .get()
          .then((value) => value.docs.toList().forEach((element) {
                listProduct.add(
                    Product.fromMap(element.data() as Map<String, dynamic>));
              }));
    }
    return listProduct;
  }

  Future<List<Product>> loadNewProducts(String category) async {
    List<Product> listProduct = [];
    if (category == "All") {
      await products
          .orderBy("idImage", descending: true)
          .limit(16)
          .get()
          .then((value) => value.docs.toList().forEach((element) {
                listProduct.add(
                    Product.fromMap(element.data() as Map<String, dynamic>));
              }));
    } else {
      await products
          .where("nameCategory", isEqualTo: category)
          .orderBy("idImage", descending: true)
          .limit(10)
          .get()
          .then((value) => value.docs.toList().forEach((element) {
                listProduct.add(
                    Product.fromMap(element.data() as Map<String, dynamic>));
              }));
    }
    return listProduct;
  }

  likeProduct(String productId) async {
    List<dynamic> listId = [];
    await users
        .doc(uid)
        .get()
        .then((value) => listId = value.get('favoriteList'))
        .onError((error, stackTrace) async => {
              await users.doc(uid).set({'favoriteList': listId}).onError(
                  (error, stackTrace) => print(error)),
            });
    listId.add(productId);
    await users.doc(uid).update({'favoriteList': listId}).then(
        (value) => print("liked product"));
  }

  Future<List<dynamic>> getListFavoriteProduct() async {
    List<dynamic> listFavoriteID = [];
    await users
        .doc(uid)
        .get()
        .then((value) => listFavoriteID = value.get('favoriteList'))
        .onError((error, stackTrace) async => {
              await users.doc(uid).set({'favoriteList': listFavoriteID}).onError(
                  (error, stackTrace) => print(error)),
            });
    return listFavoriteID;
  }

  unLikeProduct(String productId) async {
    List<dynamic> listId = [];
    await users
        .doc(uid)
        .get()
        .then((value) => listId = value.get('favoriteList'));
    listId.remove(productId);
    await users.doc(uid).update({'favoriteList': listId}).then(
        (value) => print("unlike product"));
  }
  //end==========Product==============
}
