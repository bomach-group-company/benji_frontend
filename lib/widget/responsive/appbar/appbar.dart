import 'package:benji_frontend/widget/responsive/appbar/laptop_appbar.dart';
import 'package:benji_frontend/widget/responsive/appbar/mobile_appbar.dart';
import 'package:benji_frontend/widget/responsive/appbar/tablet_appbar.dart';
import 'package:flutter/material.dart';

import '../layout.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});

  @override
  Size get preferredSize => const Size(double.infinity, 80);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: MyLayout(
        mobile: MyMobileAppBar(),
        tablet: MyTabletAppBar(),
        laptop: MyLaptopAppBar(),
      ),
    );
  }
}
