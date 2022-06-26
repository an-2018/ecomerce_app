import 'package:flutter/material.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/image_slides.dart';
import 'package:nusabomapp/widgets/product_card_horizontal.dart';

import '../../models/Product.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);
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
      details: <String, String>{"adjective": "value"},
      price: 24,
      gallery: images,
      discountValue: 0,
      hasDiscount: false,
      name: "name");
  @override
  Widget build(BuildContext context) {
    final TextStyle? heading5 = Theme.of(context).textTheme.headline5;
    final TextStyle? heading6 = Theme.of(context).textTheme.headline6;
    final TextStyle? body = Theme.of(context).textTheme.bodyLarge;
    return Scaffold(
      bottomNavigationBar: BottonNavigationWidget(),
      appBar: AppBar(
        title: Center(
            child: Text(
          "My Cart",
          style: heading5,
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            width: 48,
            height: 48,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Icon(Icons.favorite_border)),
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            ListView(
              children: [
                ProductCardHorizontal(
                  title: product.name,
                  price: product.price.toString(),
                  mainImage: product.gallery[0],
                  rating: product.details.toString(),
                  action: () => {print("Implement me")},
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  child: Column(
                    children: [
                      Text("Resume"),
                      Text("Subtotal"),
                      Divider(),
                      Text("Total"),
                      ElevatedButton(onPressed: () {}, child: Text("Checkout"))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
