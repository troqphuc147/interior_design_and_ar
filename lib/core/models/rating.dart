import 'dart:core';

class Rating {
  String idProduct;
  int star;

  Rating({required this.idProduct, required this.star});

  Map<String, dynamic> toMap() {
    return {
      'idProduct': idProduct,
      'star': star,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> data) {
    return Rating(idProduct: data['idProduct'], star: data['star']);
  }
}
