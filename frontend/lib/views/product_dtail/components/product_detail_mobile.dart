import 'package:flutter/material.dart';
import 'package:nusabomapp/constants/app_text.dart';
import 'package:nusabomapp/views/product_dtail/product_detail.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/custom_error_widget.dart';
import 'package:nusabomapp/widgets/image_slides.dart';
import 'package:provider/provider.dart';

import '../../../models/Product.dart';
import '../../../view_models/products_provider.dart';

class ProductDetailMobile extends StatefulWidget {
  String id;
  ProductDetailState controller;
  ProductDetailMobile(this.controller, {Key? key, required this.id})
      : super(key: key);
  static final images = [
    "http://placeimg.com/640/480/sports",
    "http://placeimg.com/640/480/business",
    "http://placeimg.com/640/480/abstract",
    "http://placeimg.com/640/480/food"
  ];

  @override
  State<ProductDetailMobile> createState() => _ProductDetailMobileState();
}

class _ProductDetailMobileState extends State<ProductDetailMobile> {
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
          "Details",
          style: heading5,
        )),
        backgroundColor: Colors.transparent,
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
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, _) {
          if (productProvider.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          Product product = productProvider.product;

          return Container(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ImageSlides(images: product.gallery),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      buildProductHeader(product),
                      buildProductDescription(product),
                      buildProductFooterActions(product),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildProductHeader(Product product) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            product.name,
            style: AppText.heading5(context),
          ),
          Text("Rating ${product.hasDiscount}")
        ],
      ),
    );
  }

  Widget buildProductDescription(Product product) {
    return Container(
      child: Text(
        product.description,
        style: AppText.body(context),
      ),
    );
  }

  Widget buildProductFooterActions(Product product) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$ ${product.price}",
            style: AppText.heading5(context),
          ),
          Container(
            height: 40,
            width: 120,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              "Add to Cart Btn",
              style: AppText.body(context),
            )),
          )
        ],
      ),
    );
  }
}
