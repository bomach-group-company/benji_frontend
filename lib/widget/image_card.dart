import 'package:flutter/material.dart';

class MyImageCard extends StatefulWidget {
  final String image;
  const MyImageCard({super.key, required this.image});

  @override
  State<MyImageCard> createState() => _MyImageCardState();
}

class _MyImageCardState extends State<MyImageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Image.asset(
          widget.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
