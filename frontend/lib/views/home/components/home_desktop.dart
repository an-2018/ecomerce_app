// import 'dart:io' if (dart.library.html) 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:nusabomapp/constants/app_routes.dart';
import 'package:nusabomapp/constants/app_text.dart';
import 'package:nusabomapp/view_models/products_provider.dart';
import 'package:nusabomapp/views/home/components/product_list.dart';
import 'package:nusabomapp/views/home/home.dart';
import 'package:nusabomapp/widgets/product_card.dart';
import 'package:provider/provider.dart';

class HomeDesktop extends StatefulWidget {
  final HomeController controller;
  const HomeDesktop(this.controller, {Key? key}) : super(key: key);

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  late ProductProvider productProvider;

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.list();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
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
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                color: Colors.white,
                constraints: BoxConstraints(maxWidth: 1024),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    buildHero(context),
                    Container(
                      child: Text(
                        "Discover latest products",
                        style: AppText.heading5(context),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(height: 700, child: buildProductList(context)),
                    Container(
                      height: 40,
                      width: 120,
                      child: ElevatedButton(
                          onPressed: () => {print("To Be Implemented")},
                          child: Text("View More")),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(color: Colors.black26),
                    Container(
                      height: 30,
                      child: Center(
                        child: Text("Ecommerce App Challenge"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildHero(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 5,
          child: buildHeroText(context),
        ),
        Expanded(flex: 5, child: buildHeroImage(context))
      ],
    );
  }

  Widget buildHeroText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Discover Digital Market",
          style: AppText.heading3(context),
        ),
        Text(
          "Buy and Sell Your Favorites",
          style: AppText.heading3(context),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.",
          style: AppText.body(context),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          width: 170,
          height: 50,
          child: ElevatedButton(
            onPressed: () => {}, //openInNewTab(),
            child: Row(
              children: [
                Icon(Icons.android),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Text(
                  "Download App",
                  style: AppText.body(context),
                )),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildHeroImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.30,
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hero.jpg"),
        ),
      ),
    );
  }

  Widget buildProductList(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, _) => GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: productProvider.products
            .take(6)
            .map(
              (product) => ProductCard(
                addToCartAction: () => widget.controller.addToCart(product),
                goToDetailAction: () => Navigator.pushNamed(
                    context, "${AppRoutes.productDetail}/${product.id}"),
                title: product.name,
                mainImage: product.gallery[0],
                price: "${product.price}",
                rating: '',
              ),
            )
            .toList(),
      ),
    );
  }

  // openInNewTab() {
  //   final url =
  //       "https://storage.googleapis.com/ec-challenge-store/app-release.apk";
  //   html.window.open(url, 'Android App');
  // }
}
