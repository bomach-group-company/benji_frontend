import 'package:flutter/material.dart';

import '../../../app/main/home.dart';
import '../../../app/store/search.dart';
import '../../../utils/constant.dart';
import '../../clickable.dart';

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
          MyClickable(
            navigate: const HomePage(),
            child: Image.asset(
              'assets/brand/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              const MyClickable(
                navigate: SearchPage(),
                child: Icon(
                  Icons.search,
                  color: kGreenColor,
                  size: 30,
                ),
              ),
              kWidthSizedBox,
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
        ],
      ),
    );
  }
}
