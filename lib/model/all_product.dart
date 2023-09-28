import 'dart:convert';

import 'package:benji_frontend/model/product.dart';
import 'package:http/http.dart' as http;

import '../utils/constant.dart';

class AllProduct {
  final List<Product> items;
  final int total;
  final int perPage;
  final int start;
  final int end;

  AllProduct({
    required this.items,
    required this.total,
    required this.perPage,
    required this.start,
    required this.end,
  });

  factory AllProduct.fromJson(Map<String, dynamic> json) {
    return AllProduct(
      items: (json['items'] as List)
          .map((item) => Product.fromJson(item))
          .toList(),
      total: json['total'],
      perPage: json['per_page'],
      start: json['start'],
      end: json['end'],
    );
  }
}

Future<AllProduct> fetchAllProduct([final int limit = 8]) async {
  final response =
      await http.get(Uri.parse('$baseUrl/products/listProduct?limit=$limit'));

  if (response.statusCode == 200) {
    return AllProduct.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load products');
  }
}

Future<AllProduct> fetchAllProductFilterByCategory(final String categoryId,
    [final int start = 1, final int end = 9]) async {
  final response = await http.get(Uri.parse(
      '$baseUrl/products/filterProductByCategory?category_id=$categoryId&start=$start&end=$end'));

  if (response.statusCode == 200) {
    return AllProduct.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load products');
  }
}

Future<AllProduct> fetchAllProductFilterBySubCategory(
    final String subCategoryId,
    [final int start = 1,
    final int end = 9]) async {
  final response = await http.get(Uri.parse(
      '$baseUrl/products/filterProductBySubCategory?sub_category_id=$subCategoryId&start=$start&end=$end'));

  if (response.statusCode == 200) {
    return AllProduct.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load products');
  }
}

Future<AllProduct> fetchAllProductSearchByName(final String searchItem,
    [final int start = 1, final int end = 9]) async {
  final response = await http.get(Uri.parse(
      '$baseUrl/products/SearchProductByName?search_item=$searchItem&start=$start&end=$end'));

  if (response.statusCode == 200) {
    return AllProduct.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load products');
  }
}
