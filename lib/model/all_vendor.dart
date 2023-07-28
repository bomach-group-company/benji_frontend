import 'dart:convert';

import 'package:benji_frontend/model/vendor.dart';
import 'package:http/http.dart' as http;

import '../utils/constant.dart';

class AllVendor {
  final List<Vendor> items;
  final int total;
  final String per_page;

  const AllVendor({
    required this.items,
    required this.total,
    required this.per_page,
  });

  factory AllVendor.fromJson(Map<String, dynamic> json) {
    return AllVendor(
      items: json['items'],
      total: json['total'],
      per_page: json['per_page'],
    );
  }
}

Future<Map> fetchAllVendor(final int skip) async {
  final response =
      await http.get(Uri.parse('${baseUrl}products/getAllVendor?skip=$skip'));

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load all vendors');
  }
}
