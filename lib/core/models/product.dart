import 'dart:core';

class Product {
  String id;
  String name;
  String idCategory;
  String nameCategory;
  String idImage;
  String description;
  String linkAr;
  String linkImage;
  var rating;
  var numVote;
  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.rating,
      required this.idImage,
      required this.idCategory,
      required this.numVote,
      required this.linkAr,
      required this.linkImage,
      required this.nameCategory});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'idCategory': idCategory,
      'nameCategory': nameCategory,
      'description': description,
      'rating': rating,
      'linkAr': linkAr,
      'numVote': numVote,
      'idImage': idImage,
      'linkImage': linkImage,
    };
  }

  factory Product.fromMap(Map<String, dynamic> data) {
    print('convert');
    return Product(
        id: data['id'],
        name: data['name'],
        description: data['description'],
        rating: data['rating'],
        idCategory: data['idCategory'],
        nameCategory: data['nameCategory'],
        linkImage: data['linkImage'],
        numVote: data['numVote'],
        linkAr: data['linkAr'],
        idImage: data['idImage']);
  }
}
