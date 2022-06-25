import 'package:flutter/material.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/image_slides.dart';

import '../../models/Product.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key}) : super(key: key);
  static final images = [
    "http://placeimg.com/640/480/sports",
    "http://placeimg.com/640/480/business",
    "http://placeimg.com/640/480/abstract",
    "http://placeimg.com/640/480/food"
  ];
  final Product product = Product(
      id: "id",
      description: "description",
      category: "category",
      details: "details",
      price: 24,
      gallery: images,
      discountValue: 0,
      hasDiscount: false,
      name: "name");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottonNavigationWidget(),
      appBar: AppBar(
        title: Center(child: Text("Details")),
        backgroundColor: Colors.amber.shade200,
        elevation: 0,
        actions: [
          Container(
            width: 48,
            height: 48,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Icon(Icons.favorite_border)),
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
                color: Colors.amber.shade200,
                child: ImageSlides(images: product.gallery)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(fontSize: 24),
                        ),
                        Text("Rating ${product.hasDiscount}")
                      ],
                    ),
                  ),
                  Container(
                    child: Text(product.description),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ${product.price}",
                          style: TextStyle(fontSize: 24),
                        ),
                        Container(
                          height: 40,
                          width: 120,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Text("Add to Cart Btn")),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
