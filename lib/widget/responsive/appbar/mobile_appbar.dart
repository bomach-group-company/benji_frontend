import 'package:flutter/material.dart';

import '../../../app/main/home.dart';
import '../../../app/store/search.dart';
import '../../../utils/constant.dart';
import '../../clickable.dart';

class MyMobileAppBar extends StatelessWidget {
  final bool hideSearch;
  const MyMobileAppBar({super.key, this.hideSearch = true});

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
          MyClickable(
            navigate: const HomePage(),
            child: Image.asset(
              'assets/brand/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              hideSearch
                  ? const SizedBox()
                  : const MyClickable(
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
