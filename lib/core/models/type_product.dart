import 'dart:core';

class Type {
  String id;
  String image;
  String color;

  Type({required this.id, required this.image, required this.color});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'color': color,
    };
  }

  factory Type.fromMap(Map<String, dynamic> data) {
    return Type(id: data['id'], image: data['image'], color: data['color']);
  }
}
