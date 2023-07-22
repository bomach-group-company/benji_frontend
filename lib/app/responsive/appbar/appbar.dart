import 'package:benji_frontend/app/responsive/appbar/laptop_appbar.dart';
import 'package:benji_frontend/app/responsive/appbar/mobile_appbar.dart';
import 'package:benji_frontend/app/responsive/appbar/tablet_appbar.dart';
import 'package:flutter/material.dart';

import '../layout.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

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
