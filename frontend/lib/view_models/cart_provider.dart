import 'package:flutter/material.dart';
import 'package:nusabomapp/models/Cart.dart';
import 'package:nusabomapp/models/CartItem.dart';
import 'package:nusabomapp/services/cart_api.dart';

class CartProvider with ChangeNotifier {
  bool loading = false;
  bool hasError = false;
  Cart? cart = null;
  List<CartItem> items = [];

  CartApi _api = CartApi();

  addToCart({required CartItem item, String? userId}) async {
    loading = true;
    if (cart == null) {
      cart = await _api.create(userId ?? "1");
    }
    item.cartId = cart?.id;
    cart = await _api.addToCart(item);

    loading = false;
    notifyListeners();
  }

  getCart({required int id}) async {
    loading = true;
    cart = await _api.fetchOne(id);

    loading = false;
    notifyListeners();
  }
}
