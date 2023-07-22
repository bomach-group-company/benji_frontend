import 'package:flutter/material.dart';

class MyBreadcrumb extends StatefulWidget {
  final String text;
  const MyBreadcrumb({super.key, required this.text});

  @override
  State<MyBreadcrumb> createState() => _MyBreadcrumbState();
}

class _MyBreadcrumbState extends State<MyBreadcrumb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/paragraph_bg/breadcrumb_bg_image.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Center(
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: Color(0xff2d2942),
          ),
        ),
      ),
    );
  }
}
