import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nusabomapp/constants/app_routes.dart';
import 'package:nusabomapp/view_models/search_products_provider.dart';
import 'package:nusabomapp/widgets/search_bar_widget_mobile.dart';

import '../constants/app_colors.dart';

class BottonNavigationWidget extends StatefulWidget {
  const BottonNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottonNavigationWidget> createState() => _BottonNavigationWidgetState();
}

class _BottonNavigationWidgetState extends State<BottonNavigationWidget> {
  int _selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.of(context).pushNamed(AppRoutes.home);
          break;
        case 1:
          showSearch(
              context: context,
              delegate: CustomSearchDelegate(SearchProductProvider()));
          // Navigator.of(context).pushNamed(AppRoutes.productDetail, App);
          break;
        case 2:
          Navigator.of(context).pushNamed(AppRoutes.wishlist);
          break;
        case 3:
          Navigator.of(context).pushNamed(AppRoutes.cart);
          break;
        case 4:
          Navigator.of(context).pushNamed(AppRoutes.profile);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Search"),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
          ),
          label: "wishes",
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_sharp,
            ),
            label: "Cart"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile")
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey.shade400,
      onTap: (index) => _onItemTap(index),
    );
  }
}
