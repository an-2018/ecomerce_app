import 'dart:convert';

class Product {
  final String id, name, description, category, details;
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
    final id = json["name"];
    final name = json["name"] ?? "";
    final description = json["description"] ?? "";
    final category = json["category"] ?? "";
    final details = json["details"] ?? "";
    final price = json["price"] ?? "";
    final gallery = json["gallery"] ?? "";
    final discountValue = json["discountValue"] ?? "";
    final hasDiscount = json["hasDiscount"] ?? "";

    return Product(
      id: id,
      name: name,
      discountValue: discountValue,
      category: category,
      description: description,
      details: details,
      hasDiscount: hasDiscount,
      price: price,
      gallery: gallery,
    );
  }

  String toJson() {
    return jsonEncode(<String, dynamic>{
      "title": this.name,
    });
  }
}
