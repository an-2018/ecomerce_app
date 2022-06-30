import 'package:flutter/material.dart';
import 'package:nusabomapp/models/User.dart';
import 'package:nusabomapp/models/WisheListItem.dart';
import 'package:nusabomapp/services/user_api.dart';

import '../models/Product.dart';

class UserProvider with ChangeNotifier {
  bool loading = false;
  bool hasError = false;
  User? user = null;
  List<Product> items = [];

  UserApi _api = UserApi();

  //TODO: Create user/login/register

  getUser({required int id}) async {
    loading = true;
    user = await _api.fetchOne(id);
    loading = false;
    notifyListeners();
  }

  addToWishList({required WishListItem item, String? userId = "1"}) async {
    loading = true;

    user = await _api.addToWishList(item);

    loading = false;
    notifyListeners();
  }
}
