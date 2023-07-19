import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class MyMAppBar extends StatelessWidget {
  const MyMAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          bottom: BorderSide(color: kGreenColor, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/brand/logo.png',
            fit: BoxFit.cover,
          ),
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: kGreenColor,
              size: 35,
            ),
            onPressed: () {
              // Open the drawer
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
    );
  }
}
