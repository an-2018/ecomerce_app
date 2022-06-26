import 'dart:convert';

class CartItem {
  final String id, cartId, productId;
  final int quantity;

  CartItem({
    required this.id,
    required this.cartId,
    required this.productId,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    final id = json["name"];
    final cartId = json["cartId"] ?? "";
    final productId = json["productId"] ?? "";
    final quatity = json["quantity"] ?? "";

    return CartItem(
      id: id,
      cartId: cartId,
      productId: productId,
      quantity: quatity,
    );
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
