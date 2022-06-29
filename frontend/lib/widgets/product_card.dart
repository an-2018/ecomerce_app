import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String mainImage;
  final String rating;
  final Function() goToDetailAction;
  final Function() addToCartAction;

  const ProductCard({
    Key? key,
    required this.title,
    required this.price,
    required this.mainImage,
    required this.rating,
    required this.goToDetailAction,
    required this.addToCartAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: goToDetailAction,
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(mainImage))),
                clipBehavior: Clip.hardEdge,
                child: Center(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: mainImage,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(rating),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price),
                      ElevatedButton(
                          onPressed: () => addToCartAction(),
                          child: Text("Add to Cart"))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
