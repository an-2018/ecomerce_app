import 'package:flutter/material.dart';
import 'package:nusabomapp/constants/app_routes.dart';
import 'package:nusabomapp/view_models/products_provider.dart';
import 'package:nusabomapp/widgets/product_card.dart';

class ProductListWidget extends StatelessWidget {
  final ProductProvider productProvider;
  ProductListWidget({Key? key, required this.productProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: productProvider.products
          .map(
            (product) => ProductCard(
              action: () => Navigator.pushNamed(
                  context, "${AppRoutes.productDetail}/${product.id}"),
              title: product.name,
              mainImage: product.gallery[0],
              price: "${product.price}",
              rating: '',
            ),
          )
          .toList(),
    );
  }
}
