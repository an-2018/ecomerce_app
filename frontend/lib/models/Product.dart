import 'dart:convert';

import 'package:nusabomapp/models/Cart.dart';

class Product {
  final String id, name, description, category;
  final Map<String, dynamic> details;
  final double price;
  final List<String> gallery;
  final double discountValue;
  final bool hasDiscount;
  Product(
      {required this.id,
      required this.description,
      required this.category,
      required this.details,
      required this.price,
      required this.gallery,
      required this.discountValue,
      required this.hasDiscount,
      required this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    final id = json["id"] ?? "";
    final name = json["name"] ?? "";
    final description = json["description"] ?? "";
    final category = json["category"] ?? "";
    final details = json["details"] ?? "";
    final price = json["price"] ?? "";
    final gallery = json["gallery"] ?? "";
    // final discountValue = json["discountValue"] ?? "";
    final hasDiscount = json["hasDiscount"] ?? "";

    return Product(
      id: id,
      name: name,
      discountValue: 0, //double.parse(discountValue),
      category: category,
      description: description,
      details: details,
      hasDiscount: hasDiscount,
      price: double.parse(price),
      gallery: jsonToList(gallery),
    );
  }

  String toJson() {
    return jsonEncode(<String, dynamic>{
      "title": this.name,
    });
  }
}

List<String> jsonToList(json) {
  List<String> list = [];
  json.forEach((value) => list.add(value));
  return list;
}
