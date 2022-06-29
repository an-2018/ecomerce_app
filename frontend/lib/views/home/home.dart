import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:nusabomapp/constants/app_routes.dart';
import 'package:nusabomapp/constants/app_text.dart';
import 'package:nusabomapp/layout/app_adaptive_layout.dart';
import 'package:nusabomapp/models/CartItem.dart';
import 'package:nusabomapp/view_models/cart_provider.dart';
import 'package:nusabomapp/view_models/products_provider.dart';
import 'package:nusabomapp/views/home/components/home_desktop.dart';
import 'package:nusabomapp/views/home/components/home_mobille.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/category_items.dart';
import 'package:nusabomapp/widgets/custom_error_widget.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../models/Product.dart';
import '../../widgets/product_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeController();
}

class HomeController extends State<Home> {
  late ProductProvider productProvider;
  late CartProvider cartProvider;
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      narrowLayout: HomeMobile(this),
      wideLayout: HomeDesktop(this),
    );
  }

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    super.initState();
  }

  addToCart(Product product) {
    print(product);
    CartItem item =
        CartItem(productId: int.parse(product.id), quantity: 1, product: null);
    cartProvider.addToCart(item: item);

    final snackBar = SnackBar(
      content: Container(
        child: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            SizedBox(
              width: 16,
            ),
            Text('Success: Added new item to cart'),
          ],
        ),
      ),
      backgroundColor: Colors.teal,
      action: SnackBarAction(
        label: "View Cart",
        onPressed: () => Navigator.pushNamed(context, AppRoutes.cart),
        textColor: Colors.white,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
