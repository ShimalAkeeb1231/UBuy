import 'dart:convert';
import 'package:http/http.dart' as http;
import 'productModel.dart'; // Import your product model
import 'package:flutter/material.dart';


class ApiService {
  Future<List<Product>> fetchProducts(String searchTerm) async {
    final String apiUrl = 'https://world.openfoodfacts.org/cgi/search.pl?search_terms=$searchTerm&json=true';

    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<Product> products = (data['products'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
