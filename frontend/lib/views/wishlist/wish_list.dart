import 'package:flutter/material.dart';
import 'package:nusabomapp/constants/app_text.dart';
import 'package:nusabomapp/view_models/user_provider.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/image_slides.dart';
import 'package:nusabomapp/widgets/product_card_horizontal.dart';
import 'package:provider/provider.dart';

import '../../models/Product.dart';

class WishList extends StatefulWidget {
  WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  late UserProvider userProvider;

  @override
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.getUser(id: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottonNavigationWidget(),
      appBar: AppBar(
        title: Center(
            child: Text(
          "Saved Items",
          style: AppText.heading5(context),
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
                  child: Consumer<UserProvider>(
                    builder: (context, provider, _) => Column(
                      children: buildProductList(provider.user?.wishList),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child:
          //         ElevatedButton(onPressed: () {}, child: Text("Explore more")),
          //   ),
          // )
        ],
      ),
    );
  }

  List<Widget> buildProductList(List<Product>? products) {
    if (products == null) {
      return <Widget>[];
    }
    final widgets = products.map((product) {
      return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ProductCardHorizontal(
            title: product.name,
            price: product.price.toString(),
            mainImage: product.gallery[0],
            description: product.details.toString(),
            action: () => {print("To Be Implemented")},
          ));
    }).toList();

    return widgets;
  }
}
