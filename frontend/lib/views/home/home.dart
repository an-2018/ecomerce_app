import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:nusabomapp/constants/app_routes.dart';
import 'package:nusabomapp/constants/app_text.dart';
import 'package:nusabomapp/layout/app_adaptive_layout.dart';
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
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      narrowLayout: HomeMobile(),
      wideLayout: HomeDesktop(),
    );
  }
}
