import 'dart:convert';

import 'package:nusabomapp/models/Product.dart';

class ProductList {
  final List<Product> products;
  final page;
  final limit;
  ProductList(
      {required this.products, required this.page, required this.limit});

  factory ProductList.fromJson(Map<String, dynamic> json) {
    final products = json["products"] ?? [];
    final page = json["page"];
    final limit = json["limit"];
    return ProductList(
      products: jsonToList(products),
      page: int.parse(page),
      limit: limit,
    );
  }

  String toJson() {
    return jsonEncode(<String, dynamic>{
      "products": this.products,
    });
  }
}

List<Product> jsonToList(json) {
  List<Product> list = [];
  json.forEach((value) => list.add(Product.fromJson(value)));
  return list;
}
