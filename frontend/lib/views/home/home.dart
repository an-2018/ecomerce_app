import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/category_items.dart';

import '../../constants/app_colors.dart';
import '../../models/Product.dart';
import '../../widgets/product_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    textController.value = TextEditingValue(text: "Search product");
    List<Product> productList = [
      Product(
        name: "Rosato men shirt",
        id: '1',
        description: 'Description',
        details: 'details',
        discountValue: 10,
        category: 'category',
        price: 10,
        hasDiscount: false,
        gallery: [],
      ),
      Product(
        name: "Product Name",
        id: '1',
        description: 'Description',
        details: 'details',
        discountValue: 10,
        category: 'category',
        price: 10,
        hasDiscount: false,
        gallery: [],
      ),
      Product(
        name: "T Shirt",
        id: '1',
        description: 'Description',
        details: 'details',
        discountValue: 10,
        category: 'category',
        price: 10,
        hasDiscount: false,
        gallery: [],
      ),
      Product(
        name: "Bag Woman",
        id: '1',
        description: 'Description',
        details: 'details',
        discountValue: 10,
        category: 'category',
        price: 10,
        hasDiscount: false,
        gallery: [],
      ),
    ];

    return Scaffold(
      bottomNavigationBar: const BottonNavigationWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16),
            child: Text(
              "Discover",
              style: TextStyle(color: AppColors.main, fontSize: 24),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: textController,
            ),
          ),
          CategoryItems(),
          Container(
            height: 200,
            width: double.maxFinite,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(child: Text("Hero slide")),
          ),
          Container(
            child: Text("New Trend"),
          ),
          Container(
            child: Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: GridView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    Product product = productList[index];
                    return ProductCard(
                      action: () {},
                      title: product.name,
                      mainImage: '',
                      price: "${product.price}",
                      rating: '',
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
