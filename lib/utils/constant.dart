//default value
import 'package:flutter/material.dart';

const int laptopSize = 992;
const int tabletSize = 768;
const int mobileSize = 576;

const kGreenColor = Color(0xff059542);

const kDefaultPadding = 20.0;

const kSizedBox = SizedBox(
  height: kDefaultPadding,
);
const kWidthSizedBox = SizedBox(
  width: kDefaultPadding,
);

const kHalfSizedBox = SizedBox(
  height: kDefaultPadding / 2,
);

const kHalfWidthSizedBox = SizedBox(
  width: kDefaultPadding / 2,
);

double breakPoint(double size, double mobile, double tablet, double laptop) {
  if (size <= mobileSize) {
    return mobile;
  } else if (size <= laptopSize) {
    return tablet;
  } else {
    return laptop;
  }
}
