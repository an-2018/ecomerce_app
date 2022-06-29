import 'dart:convert';

import 'package:nusabomapp/models/Product.dart';

class CartItem {
  int? id, cartId;
  int productId, quantity;
  Product? product;
  CartItem({
    this.id,
    this.cartId,
    required this.productId,
    required this.quantity,
    required this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    try {
      final id = json["id"] ?? 0;
      final cartId = json["cartId"] ?? 0;
      final productId = json["productId"] ?? 0;
      final quantity = json["quantity"] ?? 0;
      final product = Product.fromJson(json["product"] ?? <String, dynamic>{});

      final item = CartItem(
          id: id,
          cartId: cartId,
          productId: productId,
          quantity: quantity,
          product: product);
      return item;
    } catch (e) {
      throw Exception("Error Converting Cart Item $e");
    }
  }

  String toJson() {
    return jsonEncode(<String, dynamic>{
      "id": this.id,
      "cardId": this.cartId,
      "productId": this.productId,
      "quatity": this.quantity,
    });
  }
}
