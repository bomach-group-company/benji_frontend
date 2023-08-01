import 'dart:convert';

import 'package:benji_frontend/model/product.dart';
import 'package:http/http.dart' as http;

import '../utils/constant.dart';

class AllProduct {
  final List<Product> items;
  final int total;
  final int perPage;

  AllProduct({
    required this.items,
    required this.total,
    required this.perPage,
  });

  factory AllProduct.fromJson(Map<String, dynamic> json) {
    return AllProduct(
      items: (json['items'] as List)
          .map((item) => Product.fromJson(item))
          .toList(),
      total: json['total'],
      perPage: json['per_page'],
    );
  }
}

Future<AllProduct> fetchAllProduct(final int skip) async {
  final response =
      await http.get(Uri.parse('${baseUrl}products/listProduct?skip=$skip'));

  if (response.statusCode == 200) {
    return AllProduct.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load products');
  }
}
