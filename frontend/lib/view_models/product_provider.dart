import 'package:flutter/material.dart';
import 'package:nusabomapp/services/generic_api.dart';

import '../models/Product.dart';
import '../services/product_api.dart';

class ProductProvider with ChangeNotifier {
  bool loading = false;
  Product? product;
  List<Product> products = [];
  ProductApi _api = ProductApi();

  getProduct({required String id}) async {
    loading = true;
    product = await _api.fetchOne(id);
    loading = false;
    notifyListeners();
  }

  list() async {
    loading = true;
    products = await _api.fetchList();
    loading = false;
    notifyListeners();
  }
}
