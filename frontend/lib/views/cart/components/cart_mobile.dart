import 'package:flutter/material.dart';
import 'package:nusabomapp/constants/app_text.dart';
import 'package:nusabomapp/models/CartItem.dart';
import 'package:nusabomapp/models/Product.dart';
import 'package:nusabomapp/view_models/cart_provider.dart';
import 'package:nusabomapp/view_models/products_provider.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/product_card_horizontal.dart';
import 'package:provider/provider.dart';

class CartMobile extends StatefulWidget {
  const CartMobile({Key? key}) : super(key: key);

  @override
  State<CartMobile> createState() => _CartMobileState();
}

class _CartMobileState extends State<CartMobile> {
  late CartProvider cartProvider;
  late ProductProvider productProvider;
  @override
  void initState() {
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottonNavigationWidget(),
      appBar: AppBar(
        title: Center(
            child: Text(
          "My Cart",
          style: AppText.heading5(context),
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
      body: Consumer<CartProvider>(builder: (context, provider, _) {
        List<CartItem>? items =
            provider.cart != null ? provider.cart?.cartItems : [];
        print("${items?.length}");
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              ListView(
                children: buildProductList(items!),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                            "Resume: ${cartProvider.cart?.cartItems.length} items"),
                        Text("Subtotal"),
                        Divider(),
                        Text("Total: ${getTotal()}"),
                        ElevatedButton(
                            onPressed: () {}, child: Text("Checkout"))
                      ],
                    ),
                  ))
            ],
          ),
        );
      }),
    );
  }

  List<Widget> buildProductList(List<CartItem> items) {
    print("get products");
    List<Widget> productList = [];
    // Future.forEach(items, (CartItem item) async {
    //   print("productid : ${item.productId}");
    //   Product product =
    //       await productProvider.getProduct(id: item.productId.toString());
    //   products.add(product);
    // });
    // print("produc list : ${products.length}");
    for (int i = 0; i < items.length; i++) {
      Product? product = items[i].product;
      if (product != null) {
        final widget = Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: ProductCardHorizontal(
            title: product.name,
            price: product.price.toString(),
            mainImage: product.gallery[0],
            description: product.description,
            action: () => {print("Implement me")},
          ),
        );
        productList.add(widget);
      }
    }

    return productList;
  }

  double getTotal() {
    double total = 0;
    cartProvider.cart?.cartItems.forEach((element) {
      if (element != null && element.product != null) {
        total +=
            element.product != null ? (element.product?.price) as double : 0;
      }
    });
    return total;
  }
}
