import 'package:flutter/material.dart';

import '../models/Product.dart';
import '../services/product_api.dart';

class ProductProvider with ChangeNotifier {
  bool loading = false;
  bool hasError = false;
  Product product = Product(
      id: "",
      description: "",
      category: "",
      details: {},
      price: 0,
      gallery: [""],
      discountValue: 0,
      hasDiscount: false,
      name: "");
  List<Product> products = [];
  int currentPage = 1;
  ProductApi _api = ProductApi();

  getProduct({required String id}) async {
    loading = true;
    product = await _api.fetchOne(id);
    loading = false;
    notifyListeners();
  }

  list() async {
    try {
      loading = true;
      int nextPage = ++currentPage;
      final productList = await _api.fetchList(nextPage: nextPage);

      products.addAll(productList.products);
      currentPage = productList.page;
    } catch (e) {
      hasError = true;
    }
    loading = false;
    notifyListeners();
  }
}
