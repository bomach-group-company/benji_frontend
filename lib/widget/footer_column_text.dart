import 'package:flutter/material.dart';

import '../utils/constant.dart';

class FooterColumnText extends StatelessWidget {
  final String head;
  final List<String> items;
  const FooterColumnText({super.key, required this.head, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About Us',
          style: TextStyle(
            color: kGreenColor,
            fontSize: 20,
          ),
        ),
        kSizedBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: items.map((item) {
            return Text(
              item,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
