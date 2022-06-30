import 'dart:convert';

import 'package:nusabomapp/constants/app_config.dart';
import 'package:nusabomapp/models/Cart.dart';
import 'package:nusabomapp/models/CartItem.dart';
import 'package:nusabomapp/services/generic_api.dart';
import 'package:http/http.dart' as http;
import 'generic_api.dart';

class CartApi {
  static String _connectionString = "${AppConfig.apiUrl}/api/v1/carts";
  Uri uri = Uri.parse(_connectionString);

  final Map<String, String> getHeaders = {"Accept": "applcation/json"};
  final Map<String, String> postHeaders = {"Content-Type": "application/json"};

  static final CartApi _api = CartApi._privateConstructor();

  factory CartApi() {
    return _api;
  }

  CartApi._privateConstructor();

  Future<Cart> fetchOne(int id) async {
    Cart product;
    try {
      final uri = Uri.parse("$_connectionString/$id");
      final response = await http.get(uri, headers: getHeaders);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        product = Cart.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            "Failed to load data from API | ${response.reasonPhrase}");
      }
    } catch (ex) {
      throw Exception("Error: Fail to load Cart | $ex");
    }
    return product;
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

  Future<Cart> addToCart(CartItem item) async {
    Cart cart;
    final uri = Uri.parse('$_connectionString/add');
    try {
      String body = json.encode({
        "cartId": item.cartId,
        "productId": item.productId,
        "quantity": item.quantity
      });

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
}
