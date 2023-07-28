import 'dart:convert';

import 'package:benji_frontend/model/category.dart';
import 'package:http/http.dart' as http;

import '../utils/constant.dart';

class SubCategory {
  final String id;
  final String name;
  final String description;
  final Category category;
  final bool isActive;

  const SubCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.isActive,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      isActive: json['isActive'],
    );
  }
}

Future<List<SubCategory>> fetchCategories() async {
  final response = await http.get(Uri.parse('${baseUrl}sub_categories/list'));

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List)
        .map((item) => SubCategory.fromJson(item))
        .toList();
  } else {
    throw Exception('Failed to load sub categories');
  }
}

Future<SubCategory> fetchSubCategory(id) async {
  final response =
      await http.get(Uri.parse('${baseUrl}sub_categories/category/$id'));

  if (response.statusCode == 200) {
    return SubCategory.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load sub category');
  }
}
