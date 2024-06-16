// lib/local_data_service.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'productpg.dart';
import 'productModel.dart';

Future<List<Product>> loadProductsFromJson() async {
  final String response = await rootBundle.loadString('product.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => Product.fromJson(json)).toList();
}
