import 'package:flutter/material.dart';

class MyLayout extends StatelessWidget {
  final int laptopSize;
  final int mobileSize;

  final Widget laptop;
  final Widget tablet;
  final Widget mobile;

  const MyLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.laptop,
    this.mobileSize = 576,
    this.laptopSize = 992,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= mobileSize) {
          return mobile;
        } else if (constraints.maxWidth <= laptopSize) {
          return tablet;
        } else {
          return laptop;
        }
      },
    );
  }
}
