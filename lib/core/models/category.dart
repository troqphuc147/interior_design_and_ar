import 'dart:core';

class Category {
  String id;
  String name;
  List<String> listIdProduct;

  Category({required this.id, required this.name, required this.listIdProduct});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'listIdProduct': listIdProduct,
    };
  }

  factory Category.fromMap(Map<String, dynamic> data) {
    return Category(
        id: data['id'],
        name: data['name'],
        listIdProduct: data['listIdProduct']);
  }
}
