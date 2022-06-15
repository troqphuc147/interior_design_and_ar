import 'dart:core';

class Vote {
  String id;
  String idProduct;
  int star;
  Vote({required this.id, required this.star, required this.idProduct});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idProduct': idProduct,
      'star': star,
    };
  }

  factory Vote.fromMap(Map<String, dynamic> data) {
    return Vote(
        id: data['id'], star: data['star'], idProduct: data['idProduct']);
  }
}
