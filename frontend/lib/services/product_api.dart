import 'dart:convert';

import 'package:nusabomapp/constants/app_config.dart';
import 'package:nusabomapp/models/Product.dart';
import 'package:nusabomapp/models/ProductList.dart';
import 'package:nusabomapp/services/generic_api.dart';
import 'package:http/http.dart' as http;
import 'generic_api.dart';

class ProductApi implements GenericApi<Product, ProductList> {
  static String _connectionString = "${AppConfig.apiUrl}/api/v1/products";
  Uri uri = Uri.parse(_connectionString);

  final Map<String, String> getHeaders = {"Accept": "applcation/json"};
  final Map<String, String> postHeaders = {"Content-Type": "application/json"};

  static final ProductApi _api = ProductApi._privateConstructor();

  factory ProductApi() {
    return _api;
  }

  ProductApi._privateConstructor();

  @override
  Future<ProductList> fetchList({String? search, int? nextPage}) async {
    ProductList products;
    try {
      uri = Uri.parse("$_connectionString/?page=$nextPage");
      final response = await http.get(uri, headers: getHeaders);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        products = ProductList.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            "Warning Failed to load data list from API | ${response.reasonPhrase}");
      }
    } catch (ex) {
      throw Exception("Error: Fail to load Products | $ex");
    }
    return products;
  }

  @override
  Future<Product> fetchOne(String param) async {
    Product product;
    try {
      final uri = Uri.parse("$_connectionString/$param");
      final response = await http.get(uri, headers: getHeaders);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        product = Product.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            "Failed to load data from API | ${response.reasonPhrase}");
      }
    } catch (ex) {
      throw Exception("Error: Fail to load Product | $ex");
    }
    return product;
  }
}
