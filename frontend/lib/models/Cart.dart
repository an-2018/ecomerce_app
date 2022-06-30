import 'dart:convert';

import 'package:nusabomapp/models/CartItem.dart';

class Cart {
  final int id, userId;
  final List<CartItem> cartItems;

  Cart({required this.id, required this.cartItems, required this.userId});

  factory Cart.fromJson(Map<String, dynamic> json) {
    try {
      final id = json["id"] ?? 0;
      final userId = json["userId"] ?? 0;
      final cartItems = json["items"] ?? [];

      final items = jsonToList(cartItems);

      final cart = Cart(
        id: id,
        userId: int.parse(userId),
        cartItems: items,
      );
      return cart;
    } catch (e) {
      throw Exception("Error Converting Cart: $e");
    }
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
  json.forEach((value) => list.add(CartItem.fromJson(value)));
  return list;
}
