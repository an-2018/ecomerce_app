import 'dart:convert';

import 'package:nusabomapp/models/CartItem.dart';

class Cart {
  final String id, userId;
  final List<CartItem> cartItems;

  Cart({required this.id, required this.cartItems, required this.userId});

  factory Cart.fromJson(Map<String, dynamic> json) {
    final id = json["name"];
    final userId = json["userId"] ?? "";
    final cartItems = json["cartItems"] ?? "";

    return Cart(
      id: id,
      userId: userId,
      cartItems: jsonToList(cartItems),
    );
  }

  String toJson() {
    return jsonEncode(<String, dynamic>{
      "id": this.id,
      "userId": this.userId,
      "cartItems": this.cartItems.toString(),
    });
  }
}

List<CartItem> jsonToList(json) {
  List<CartItem> list = [];
  json.forEach((key, value) => list.add(CartItem.fromJson(value)));
  return list;
}
