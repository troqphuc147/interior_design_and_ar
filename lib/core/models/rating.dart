import 'dart:core';

class Rating {
  String id;
  String userId;
  int star;

  Rating({required this.id, required this.userId, required this.star});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'star': star,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> data) {
    return Rating(id: data['id'], userId: data['userId'], star: data['star']);
  }
}
