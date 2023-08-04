import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/constant.dart';

class Category {
  final String id;
  final String name;
  final String description;
  final bool isActive;

  const Category({
    required this.id,
    required this.name,
    required this.description,
    required this.isActive,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isActive: json['is_active'],
    );
  }
}

Future<List<Category>> fetchCategories() async {
  final response = await http.get(Uri.parse('$baseUrl/categories/list'));

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List)
        .map((item) => Category.fromJson(item))
        .toList();
  } else {
    throw Exception('Failed to load categories');
  }
}

Future<Category> fetchCategory(id) async {
  final response =
      await http.get(Uri.parse('$baseUrl/categories/category/$id'));

  if (response.statusCode == 200) {
    return Category.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load category');
  }
}
