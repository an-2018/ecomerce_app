import 'package:flutter/material.dart';
import 'package:nusabomapp/layout/app_adaptive_layout.dart';
import 'package:nusabomapp/views/cart/components/cart_desktop.dart';
import 'package:nusabomapp/views/cart/components/cart_mobile.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/product_card_horizontal.dart';

import '../../models/Product.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);
  static final images = [
    "http://placeimg.com/640/480/sports",
    "http://placeimg.com/640/480/business",
    "http://placeimg.com/640/480/abstract",
    "http://placeimg.com/640/480/food"
  ];

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final Product product = Product(
      id: "id",
      description: "description",
      category: "category",
      details: <String, String>{"adjective": "value"},
      price: 24,
      gallery: Cart.images,
      discountValue: 0,
      hasDiscount: false,
      name: "name");

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      narrowLayout: CartMobile(),
      wideLayout: CartDesktop(),
    );
  }
}
