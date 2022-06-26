import 'dart:convert';

class Review {
  final String id, userId, productId, comment;
  final int rating;

  Review({
    required this.id,
    required this.userId,
    required this.productId,
    required this.comment,
    required this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    final id = json["name"];
    final userId = json["userId"] ?? "";
    final productId = json["productId"] ?? "";
    final comment = json["comment"] ?? "";
    final rating = json["rating"] ?? "";

    return Review(
      id: id,
      userId: userId,
      productId: productId,
      comment: comment,
      rating: rating,
    );
  }

  String toJson() {
    return jsonEncode(<String, dynamic>{
      "id": this.id,
      "userId": this.userId,
      "productId": this.productId,
      "comment": this.comment,
      "rating": this.rating,
    });
  }
}
