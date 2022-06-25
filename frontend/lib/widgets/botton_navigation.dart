import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nusabomapp/constants/app_routes.dart';

import '../constants/app_colors.dart';

class BottonNavigationWidget extends StatefulWidget {
  const BottonNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottonNavigationWidget> createState() => _BottonNavigationWidgetState();
}

class _BottonNavigationWidgetState extends State<BottonNavigationWidget> {
  int _selectedIndex = 1;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.of(context).pushNamed(AppRoutes.home);
          break;
        case 1:
          Navigator.of(context).pushNamed(AppRoutes.productDetail);
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
            color: AppColors.main,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: AppColors.main,
            ),
            label: "Search"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.heart_broken,
              color: AppColors.main,
            ),
            label: "wishes"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_sharp,
              color: AppColors.main,
            ),
            label: "Cart"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: AppColors.main,
            ),
            label: "Profile")
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTap,
    );
  }
}
