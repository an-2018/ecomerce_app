import 'package:flutter/material.dart';
import 'package:nusabomapp/constants/app_routes.dart';
import 'package:nusabomapp/view_models/cart_provider.dart';
import 'package:nusabomapp/view_models/products_provider.dart';
import 'package:nusabomapp/view_models/search_products_provider.dart';
import 'package:nusabomapp/view_models/user_provider.dart';
import 'package:nusabomapp/views/cart/cart.dart';
import 'package:nusabomapp/views/home/home.dart';
import 'package:nusabomapp/views/product_dtail/product_detail.dart';
import 'package:nusabomapp/views/profile/profile.dart';
import 'package:nusabomapp/views/wishlist/wish_list.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import './route/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SingleChildWidget> providers = [
      ChangeNotifierProvider(
        create: (_) => ProductProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => SearchProductProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => CartProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
      ),
    ];

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NuSaBom',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        initialRoute: AppRoutes.productDetail,
        onGenerateRoute: (settings) {
          if (settings.name == AppRoutes.home) {
            return MaterialPageRoute(builder: (context) => Home());
          }
          if (settings.name == AppRoutes.cart) {
            return MaterialPageRoute(builder: (context) => Cart());
          }
          if (settings.name == AppRoutes.wishlist) {
            return MaterialPageRoute(builder: (context) => WishList());
          }
          if (settings.name == AppRoutes.profile) {
            return MaterialPageRoute(builder: (context) => Profile());
          }
          var uri = Uri.parse(settings.name as String);
          if (uri.pathSegments.length == 2 &&
              uri.pathSegments.first == AppRoutes.productDetail) {
            var id = uri.pathSegments[1];
            return MaterialPageRoute(
                builder: (context) => ProductDetail(id: id));
          }
        },
        // routes: {
        //   AppRoutes.home: (context) => const Home(),
        //   AppRoutes.wishlist: (context) => WishList(),
        //   AppRoutes.cart: (context) => Cart(),
        //   AppRoutes.profile: (context) => Profile()
        // },
      ),
    );
  }
}
