import 'package:flutter/material.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/image_slides.dart';
import 'package:nusabomapp/widgets/product_card_horizontal.dart';

import '../../models/Product.dart';

class WishList extends StatelessWidget {
  WishList({Key? key}) : super(key: key);
  static final images = [
    "http://placeimg.com/640/480/sports",
    "http://placeimg.com/640/480/business",
    "http://placeimg.com/640/480/abstract",
    "http://placeimg.com/640/480/food"
  ];
  final List<Product> products = [
    Product(
        id: "id",
        description: "description",
        category: "category",
        details: <String, String>{"adjective": "value"},
        price: 24,
        gallery: images,
        discountValue: 0,
        hasDiscount: false,
        name: "name"),
    Product(
        id: "id",
        description: "description",
        category: "category",
        details: <String, String>{"adjective": "value"},
        price: 24,
        gallery: images,
        discountValue: 0,
        hasDiscount: false,
        name: "name"),
    Product(
        id: "id",
        description: "description",
        category: "category",
        details: <String, String>{"adjective": "value"},
        price: 24,
        gallery: images,
        discountValue: 0,
        hasDiscount: false,
        name: "name")
  ];
  @override
  Widget build(BuildContext context) {
    final TextStyle? heading5 = Theme.of(context).textTheme.headline5;
    final TextStyle? heading6 = Theme.of(context).textTheme.headline6;
    final TextStyle? body = Theme.of(context).textTheme.bodyLarge;
    final product = products[0];
    final product1 = products[1];
    final product2 = products[2];

    return Scaffold(
      bottomNavigationBar: BottonNavigationWidget(),
      appBar: AppBar(
        title: Center(
            child: Text(
          "Saved Items",
          style: heading5,
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      for (int i = 0; i < 15; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: ProductCardHorizontal(
                            title: product.name,
                            price: product.price.toString(),
                            mainImage: product.gallery[0],
                            description: product.details.toString(),
                            action: () => {print("Implement me")},
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child:
                  ElevatedButton(onPressed: () {}, child: Text("Explore more")),
            ),
          )
        ],
      ),
    );
  }
}
