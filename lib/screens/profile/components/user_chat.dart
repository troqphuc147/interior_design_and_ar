import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserChat {
  String id;
  String name;
  String email;
  String photoUrl;

  UserChat({required this.id, required this.name, required this.email, required this.photoUrl});

  factory UserChat.fromDocument(DocumentSnapshot doc) {
    print(doc.data().toString());
    return UserChat(
      id: doc.id,
      name: doc.get('name').toString(),
      email: doc.get('email').toString(),
      photoUrl: doc.get('photoUrl').toString(),
    );
  }

}