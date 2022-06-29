import 'dart:convert';

import 'package:nusabomapp/models/Product.dart';

class User {
  final String name, email;
  final int id;
  final List<Product> wishList;

  User(
      {required this.id,
      required this.email,
      required this.wishList,
      required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    try {
      final id = json["id"];
      final name = json["name"] ?? "";
      final email = json["email"] ?? "";
      final wishlist = json["wishlist"] ?? [];

      final items = jsonToList(wishlist);

      return User(
        id: id,
        name: name,
        email: email,
        wishList: items,
      );
    } catch (e) {
      throw Exception("Error Convertin user $e");
    }
  }

  String toJson() {
    return jsonEncode(<String, dynamic>{
      "email": this.email,
      "name": this.name,
      "wishlist": this.wishList.toString(),
      "id": this.id,
    });
  }
}

List<Product> jsonToList(json) {
  List<Product> list = [];
  json.forEach((value) => list.add(Product.fromJson(value)));
  return list;
}
