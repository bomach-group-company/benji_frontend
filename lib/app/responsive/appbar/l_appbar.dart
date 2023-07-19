import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../widget/drop.dart';
import '../../../widget/text.dart';

class MyLAppBar extends StatelessWidget {
  const MyLAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      padding:
          EdgeInsets.symmetric(vertical: 12, horizontal: media.width * 0.08),
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HoverColorText(
                text: 'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                ),
                active: true,
              ),
              kWidthSizedBox,
              kWidthSizedBox,
              Stack(
                clipBehavior: Clip.none,
                children: [
                  HoverColorText(
                    text: 'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: -20,
                    child: MyDropDown(),
                  ),
                ],
              ),
              kWidthSizedBox,
              kWidthSizedBox,
              HoverColorText(
                text: 'Help & Contact Us',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.search,
                color: Colors.white,
              ),
              kWidthSizedBox,
              const Text(
                '|',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w100,
                ),
              ),
              kWidthSizedBox,
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(Icons.shopping_cart, color: Colors.white),
                  Positioned(
                    right: -8,
                    top: -8,
                    child: Container(
                      alignment: const Alignment(0, 0),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: kGreenColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '0',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              kWidthSizedBox,
              kWidthSizedBox,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kGreenColor,
                    fixedSize: const Size(80, 35)),
                onPressed: () {},
                child: const Text('Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
