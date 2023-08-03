import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class MyTabletAppBar extends StatelessWidget {
  const MyTabletAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      padding:
          EdgeInsets.symmetric(vertical: 12, horizontal: media.width * 0.1),
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
          InkWell(
            mouseCursor: SystemMouseCursors.click,
            child: const Icon(
              Icons.menu,
              color: kGreenColor,
              size: 35,
            ),
            onTap: () {
              // Open the drawer
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
    );
  }
}
