import 'dart:convert';
import 'package:grocery/features/Trial/model.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static const String baseUrl = "https://dummyjson.com/products";

  Future<List<Product>> fetchProducts(int limit, int skip) async {
    final response = await http.get(Uri.parse("$baseUrl?limit=$limit&skip=$skip"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Product> products = (data['products'] as List)
          .map((json) => Product.fromJson(json))
          .toList();
      return products;
    } else {
      throw Exception("Failed to load products");
    }
  }
}
