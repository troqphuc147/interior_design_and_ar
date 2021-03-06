import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/core/models/rating.dart';

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
    print(uid);
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

  Future<List<Product>> getListFavoriteProduct() async {
    List<Product> listProduct = [];
    List<String> listId = [];

    await getListFavoriteProductId().then((value) => {
          listId.addAll(value),
          print(value.length),
        });

    if (listId.isEmpty) {
      return listProduct;
    }
    await products
        .where('id', whereIn: listId)
        .get()
        .then((value) => value.docs.toList().forEach((element) {
              listProduct
                  .add(Product.fromMap(element.data() as Map<String, dynamic>));
            }));
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

  Future<List<Rating>> getListRating() async {
    List<Rating> listRating = [];
    await users
        .doc(uid)
        .collection("Voted")
        .get()
        .then((value) => value.docs.toList().forEach((element) {
              Rating rating = Rating.fromMap(element.data());
              listRating.add(rating);
            }));
    return listRating;
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
          .limit(30)
          .get()
          .then((value) => value.docs.toList().forEach((element) {
                listProduct.add(
                    Product.fromMap(element.data() as Map<String, dynamic>));
              }));
    } else {
      await products
          .where("nameCategory", isEqualTo: category)
          .orderBy("numVote", descending: true)
          .limit(30)
          .get()
          .then((value) => value.docs.toList().forEach((element) {
                listProduct.add(
                    Product.fromMap(element.data() as Map<String, dynamic>));
              }));
    }
    return listProduct;
  }

  Future<List<Product>> getListProductById(List<String> listId) async {
    List<Product> listProduct = [];
    int t = 0;
    while (listProduct.length < listId.length) {
      int start = t;
      int end = start + 9 > listId.length ? listId.length : start + 9;
      await products
          .where("id", whereIn: listId.sublist(start, end))
          .get()
          .then((value) => value.docs.toList().forEach((element) {
                listProduct.add(
                    Product.fromMap(element.data() as Map<String, dynamic>));
              }));
      t += 9;
    }
    return listProduct;
  }

  Future<List<Product>> loadNewProducts(String category) async {
    List<Product> listProduct = [];
    if (category == "All") {
      await products
          .orderBy("idImage", descending: true)
          .limit(30)
          .get()
          .then((value) => value.docs.toList().forEach((element) {
                listProduct.add(
                    Product.fromMap(element.data() as Map<String, dynamic>));
              }));
    } else {
      await products
          .where("nameCategory", isEqualTo: category)
          .orderBy("idImage", descending: true)
          .limit(30)
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

  userFromMap() {}

  Future<List<String>> getListFavoriteProductId() async {
    List<dynamic> listFavoriteID = [];
    await users
        .doc(uid)
        .get()
        .then((value) => listFavoriteID = value.get('favoriteList'))
        .onError((error, stackTrace) async => {
              await users
                  .doc(uid)
                  .set({'favoriteList': listFavoriteID}).onError(
                      (error, stackTrace) => print(error)),
            });
    List<String> rs = [];
    for (var element in listFavoriteID) {
      rs.add(element.toString());
    }
    return rs;
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
