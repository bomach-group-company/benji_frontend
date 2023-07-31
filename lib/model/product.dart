import 'dart:convert';

import 'package:benji_frontend/model/sub_category.dart';
import 'package:benji_frontend/model/vendor.dart';
import 'package:http/http.dart' as http;

import '../utils/constant.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final Vendor vendorId;
  final SubCategory subCategoryId;
  final int price;
  final bool isAvailable;
  final bool isTrending;
  final bool isRecommended;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.vendorId,
    required this.subCategoryId,
    required this.price,
    required this.isAvailable,
    required this.isTrending,
    required this.isRecommended,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      vendorId: json['vendor_id'],
      subCategoryId: json['sub_category_id'],
      price: json['price'],
      isAvailable: json['is_available'],
      isTrending: json['is_trending'],
      isRecommended: json['is_recommended'],
    );
  }
}

Future<Product> fetchProduct(id) async {
  final response = await http.get(Uri.parse('${baseUrl}products/product/$id'));

  if (response.statusCode == 200) {
    return Product.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load product');
  }
}
