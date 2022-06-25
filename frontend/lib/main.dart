import 'package:flutter/material.dart';
import 'package:nusabomapp/constants/app_routes.dart';
import 'package:nusabomapp/views/home/home.dart';
import 'package:nusabomapp/views/product_dtail/product_detail.dart';
import './route/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NuSaBom',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: AppRoutes.productDetail,
      routes: {
        AppRoutes.home: (context) => const Home(),
        AppRoutes.productDetail: (context) => ProductDetail()
      },
    );
  }
}
