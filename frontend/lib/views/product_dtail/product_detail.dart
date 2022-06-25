import 'package:flutter/material.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';

import '../../models/Product.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key}) : super(key: key);
  final Product product = Product(
      id: "id",
      description: "description",
      category: "category",
      details: "details",
      price: 24,
      gallery: [],
      discountValue: 0,
      hasDiscount: false,
      name: "name");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottonNavigationWidget(),
      appBar: AppBar(
        title: Center(child: Text("Details")),
        backgroundColor: Colors.amber,
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
              height: 300,
              decoration: BoxDecoration(color: Colors.amber),
            ),
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
