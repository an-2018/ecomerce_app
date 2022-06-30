import 'dart:convert';

import 'package:nusabomapp/models/Product.dart';

class ProductList {
  final List<Product> products;
  final int page;
  final int limit;
  ProductList(
      {required this.products, required this.page, required this.limit});

  factory ProductList.fromJson(Map<String, dynamic> json) {
    final products = json["products"] ?? [];
    final page = json["page"] ?? "1";
    final limit = json["limit"] ?? 10;

    final productList = jsonToList(products);

    final list = ProductList(
      products: productList,
      page: int.parse(page),
      limit: limit,
    );

    return list;
  }

  String toJson() {
    return jsonEncode(<String, dynamic>{
      "products": this.products,
    });
  }
}

List<Product> jsonToList(json) {
  List<Product> list = [];
  json.forEach((value) {
    Product product = Product.fromJson(value);

    list.add(product);
  });
  return list;
}
