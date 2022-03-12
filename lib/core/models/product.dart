import 'dart:core';

class Product {
  String id;
  String name;
  String idCategory;
  String nameCategory;
  String description;
  double rating;
  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.rating,
      required this.idCategory,
      required this.nameCategory});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'idCategory': idCategory,
      'nameCategory': nameCategory,
      'description': description,
      'rating': rating,
    };
  }

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
        id: data['id'],
        name: data['name'],
        description: data['description'],
        rating: data['rating'],
        idCategory: data['idCategory'],
        nameCategory: data['nameCategory']);
  }
}
