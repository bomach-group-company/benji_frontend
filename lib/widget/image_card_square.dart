import 'package:flutter/material.dart';

class MyImageCardSquare extends StatefulWidget {
  final String image;
  const MyImageCardSquare({super.key, required this.image});

  @override
  State<MyImageCardSquare> createState() => _MyImageCardSquareState();
}

class _MyImageCardSquareState extends State<MyImageCardSquare> {
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
