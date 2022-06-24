import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/app_colors.dart';

class BottonNavigationWidget extends StatelessWidget {
  const BottonNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: AppColors.main,
            ),
            label: "Home"),
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
    );
  }
}
