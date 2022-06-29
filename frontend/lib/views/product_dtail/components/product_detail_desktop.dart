import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nusabomapp/constants/app_routes.dart';
import 'package:nusabomapp/constants/app_text.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/custom_error_widget.dart';
import 'package:nusabomapp/widgets/image_slides.dart';
import 'package:provider/provider.dart';

import '../../../models/Product.dart';
import '../../../view_models/products_provider.dart';
import '../product_detail.dart';

class ProductDetailDesktop extends StatefulWidget {
  String id;
  ProductDetailState controller;
  ProductDetailDesktop(this.controller, {Key? key, required this.id})
      : super(key: key);

  @override
  State<ProductDetailDesktop> createState() => _ProductDetailDesktopState();
}

class _ProductDetailDesktopState extends State<ProductDetailDesktop> {
  @override
  Widget build(BuildContext context) {
    Product product = widget.controller.productProvider.product;
    return Scaffold(
      appBar: buildAppBar(),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, _) {
          if (productProvider.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 1200),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildMainProductInfo(product),
                  buildImageSlider(product)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Center(
          child: TextButton(
            onPressed: () => {Navigator.pushNamed(context, AppRoutes.home)},
            child: Text(
              "Home",
              style: AppText.heading6(context),
            ),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () => {print("To Be Implemented")},
            child: Text(
              "Products",
              style: AppText.heading6(context),
            ),
          ),
        ),
        SizedBox(
          width: 32,
        )
      ],
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
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Icon(Icons.favorite_border)),
              ),
              Container(
                height: 40,
                width: 120,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "Add to Cart Btn",
                  style: AppText.body(context),
                )),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildImageSlider(Product product) {
    return Expanded(
      child: Container(
        width: 300,
        // height: double.maxFinite,
        child: ImageSlides(
          images: product.gallery,
          isMobile: false,
        ),
      ),
    );
  }

  Widget buildMainProductInfo(Product product) {
    return Container(
      height: double.maxFinite,
      padding: EdgeInsets.only(top: 32),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: 300,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(product.gallery.first),
                  ),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: product.gallery.first,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 500),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: AppText.heading4(context),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      product.description,
                      style: AppText.heading5(context),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    buildProductFooterActions(product)
                  ],
                ),
              )
            ],
          ),
          Container(
            child: Text("Product comments"),
          )
        ],
      ),
    );
  }
}
