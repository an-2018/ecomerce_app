import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nusabomapp/models/User.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/image_slides.dart';
import 'package:nusabomapp/widgets/product_card_horizontal.dart';

import '../../models/Product.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? heading5 = Theme.of(context).textTheme.headline5;
    final TextStyle? heading6 = Theme.of(context).textTheme.headline6;
    final TextStyle? body = Theme.of(context).textTheme.bodyLarge;
    final user = User(
      id: 1,
      email: "email",
      wishList: [],
      name: "name",
    );
    return Scaffold(
      bottomNavigationBar: BottonNavigationWidget(),
      appBar: AppBar(
        title: Center(
            child: Text(
          "Profile",
          style: heading5,
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: user.name,
                  errorWidget: (context, item, _) => Icon(Icons.image_search),
                ),
              ],
            ),
            ListTile(
              title: Text(user.name),
              leading: Icon(Icons.shopping_cart),
              trailing: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
