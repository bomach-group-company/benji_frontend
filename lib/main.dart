import 'package:flutter/material.dart';

import 'app/main/blog_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Benji',
      home: BlogDetailsPage(),
    );
  }
}
