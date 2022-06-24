import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String mainImage;
  final String rating;
  final Function() action;

  const ProductCard(
      {Key? key,
      required this.title,
      required this.price,
      required this.mainImage,
      required this.rating,
      required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 300,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            color: Colors.deepOrange, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.black),
            ),
            Text(title),
            Text(rating),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price),
                ElevatedButton(onPressed: () => action, child: Text("Add Cart"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
