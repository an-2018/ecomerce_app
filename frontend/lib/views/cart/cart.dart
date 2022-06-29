import 'package:flutter/material.dart';
import 'package:nusabomapp/layout/app_adaptive_layout.dart';
import 'package:nusabomapp/views/cart/components/cart_desktop.dart';
import 'package:nusabomapp/views/cart/components/cart_mobile.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/product_card_horizontal.dart';

import '../../models/Product.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      narrowLayout: CartMobile(),
      wideLayout: CartDesktop(),
    );
  }
}
