import 'dart:convert';

class User {
  final String id, name, email;
  final List<String> wishList;

  User(
      {required this.id,
      required this.email,
      required this.wishList,
      required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    final id = json["name"];
    final name = json["name"] ?? "";
    final email = json["email"] ?? "";
    final wishlist = json["wishlist"] ?? "";

    return User(
      id: id,
      name: name,
      email: email,
      wishList: wishlist,
    );
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
