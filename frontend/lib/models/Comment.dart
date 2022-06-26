import 'dart:convert';

class Comment {
  final String id, userId, productId, comment;

  Comment({
    required this.id,
    required this.userId,
    required this.productId,
    required this.comment,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    final id = json["name"];
    final userId = json["userId"] ?? "";
    final productId = json["productId"] ?? "";
    final comment = json["comment"] ?? "";

    return Comment(
        id: id, userId: userId, productId: productId, comment: comment);
  }

  String toJson() {
    return jsonEncode(<String, dynamic>{
      "id": this.id,
      "userId": this.userId,
      "productId": this.productId,
      "comment": this.comment,
    });
  }
}
