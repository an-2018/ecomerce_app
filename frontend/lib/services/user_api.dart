import 'dart:convert';

import 'package:nusabomapp/constants/app_config.dart';
import 'package:nusabomapp/models/Cart.dart';
import 'package:nusabomapp/models/CartItem.dart';
import 'package:nusabomapp/models/User.dart';
import 'package:nusabomapp/models/WisheListItem.dart';
import 'package:nusabomapp/services/generic_api.dart';
import 'package:http/http.dart' as http;
import 'package:nusabomapp/views/wishlist/wish_list.dart';
import 'generic_api.dart';

class UserApi {
  static String _connectionString = "${AppConfig.apiUrl}/api/v1/users";
  Uri uri = Uri.parse(_connectionString);

  final Map<String, String> getHeaders = {"Accept": "applcation/json"};
  final Map<String, String> postHeaders = {"Content-Type": "application/json"};

  static final UserApi _api = UserApi._privateConstructor();

  factory UserApi() {
    return _api;
  }

  UserApi._privateConstructor();

  Future<User> fetchOne(int id) async {
    User user;
    try {
      final uri = Uri.parse("$_connectionString/$id");
      final response = await http.get(uri, headers: getHeaders);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        user = User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            "Failed to load data from API | ${response.reasonPhrase}");
      }
    } catch (ex) {
      throw Exception("Error: Fail to load User | $ex");
    }
    return user;
  }

  Future<Cart> create(String id) async {
    Cart cart;
    final uri = Uri.parse("$_connectionString");
    try {
      String body = json.encode({"userId": id});

      final response = await http.post(uri, headers: postHeaders, body: body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        cart = Cart.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            "Warning Failed to load cart data list from API | ${response.reasonPhrase}");
      }
    } catch (ex) {
      throw Exception("Error: Fail to load Cart data | $ex");
    }
    return cart;
  }

  Future<User> addToWishList(WishListItem item) async {
    User user;
    final uri = Uri.parse('$_connectionString/wishlist');
    try {
      String body = json.encode({
        "userId": item.userId,
        "productId": item.productId,
      });

      final response = await http.post(uri, headers: postHeaders, body: body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        user = User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            "Warning Failed to load cart data list from API | ${response.reasonPhrase}");
      }
    } catch (ex) {
      throw Exception("Error: Fail to load Cart data | $ex");
    }
    return user;
  }
}
