import 'package:flutter/material.dart';
import 'package:nusabomapp/constants/app_routes.dart';
import 'package:nusabomapp/constants/app_text.dart';
import 'package:nusabomapp/layout/app_adaptive_layout.dart';
import 'package:nusabomapp/models/CartItem.dart';
import 'package:nusabomapp/models/WisheListItem.dart';
import 'package:nusabomapp/view_models/cart_provider.dart';
import 'package:nusabomapp/view_models/user_provider.dart';
import 'package:nusabomapp/views/product_dtail/components/product_detail_desktop.dart';
import 'package:nusabomapp/views/product_dtail/components/product_detail_mobile.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/custom_error_widget.dart';
import 'package:nusabomapp/widgets/image_slides.dart';
import 'package:provider/provider.dart';

import '../../models/Product.dart';
import '../../view_models/products_provider.dart';

class ProductDetail extends StatefulWidget {
  final String id;
  ProductDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetail> createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetail> {
  late ProductProvider productProvider;
  late CartProvider cartProvider;
  late UserProvider userProvider;

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);
    productProvider.getProduct(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      narrowLayout: ProductDetailMobile(
        this,
        id: widget.id,
      ),
      wideLayout: ProductDetailDesktop(
        this,
        id: widget.id,
      ),
    );
  }

  addToCart(Product product) {
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

  addToWishList(Product product) {
    WishListItem item = WishListItem(
        productId: int.parse(product.id),
        product: null,
        userId: 1); //TODO: chamge userid
    userProvider.addToWishList(item: item);

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
            Text('Success: Added new item to your wishlist'),
          ],
        ),
      ),
      backgroundColor: Colors.teal,
      action: SnackBarAction(
        label: "View List",
        onPressed: () => Navigator.pushNamed(context, AppRoutes.wishlist),
        textColor: Colors.white,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
