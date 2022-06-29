import 'dart:convert';

import 'package:nusabomapp/models/Product.dart';

class WishListItem {
  int productId, userId;
  Product? product;
  WishListItem({
    required this.productId,
    required this.userId,
    required this.product,
  });

  factory WishListItem.fromJson(Map<String, dynamic> json) {
    final productId = json["productId"] ?? 0;
    final userId = json["userId"] ?? 0;
    final product = Product.fromJson(json["product"]);

    final item =
        WishListItem(productId: productId, userId: userId, product: product);
    return item;
  }

  String toJson() {
    return jsonEncode(<String, dynamic>{
      "product": this.product?.toJson(),
      "productId": this.productId,
      "userId": this.userId,
    });
  }
}
