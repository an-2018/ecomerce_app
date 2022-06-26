import 'package:flutter/material.dart';
import 'package:nusabomapp/constants/app_text.dart';
import 'package:nusabomapp/layout/app_adaptive_layout.dart';
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

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
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
}
