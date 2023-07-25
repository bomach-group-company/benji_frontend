import 'package:benji_frontend/app/page/home.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../widget/hover_text.dart';
import '../../page/category.dart';

class MyLaptopAppBar extends StatefulWidget {
  const MyLaptopAppBar({super.key});

  @override
  State<MyLaptopAppBar> createState() => _MyLaptopAppBarState();
}

class _MyLaptopAppBarState extends State<MyLaptopAppBar> {
  bool visible = false;

  final List items = [
    'Meat',
    'Beverage',
    'Vegetables',
    'Beverage',
    'Meat',
    'Vegetables',
    'Meat',
    'Beverage'
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      padding:
          EdgeInsets.symmetric(vertical: 12, horizontal: media.width * 0.07),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HoverColorText(
                text: 'Home',
                navigate: HomePage(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                ),
                active: true,
              ),
              kWidthSizedBox,
              kWidthSizedBox,
              PopupMenuButton(
                constraints:
                    const BoxConstraints(maxHeight: 170, maxWidth: 200),
                tooltip: '',
                position: PopupMenuPosition.under,
                elevation: 0,
                splashRadius: 0,
                child: const Center(
                  child: HoverColorText(
                    text: 'Menu',
                    isDrop: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                  ),
                ),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text("Meat"),
                    ),
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text("Rice"),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text("Bread"),
                    ),
                    const PopupMenuItem<int>(
                      value: 3,
                      child: Text("Groceries"),
                    ),
                    const PopupMenuItem<int>(
                      value: 4,
                      child: Text("Yam"),
                    ),
                    const PopupMenuItem<int>(
                      value: 5,
                      child: Text("Beans"),
                    ),
                    const PopupMenuItem<int>(
                      value: 6,
                      child: Text("Ice cream"),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                    print('in here now');
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const CategoryPage(),
                      ),
                    );
                  }
                },
              ),
              // Stack(
              //   clipBehavior: Clip.none,
              //   children: [
              //     HoverColorText(
              //       text: 'Menu',
              //       isDrop: true,
              //       style: const TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.w200,
              //         fontSize: 16,
              //       ),
              //       onTap: () {
              //         setState(() {
              //           visible = !visible;
              //         });
              //       },
              //     ),
              //     Positioned(
              //       top: 40,
              //       left: -20,
              //       child: MyDropDown(
              //         visible: visible,
              //         items: items,
              //       ),
              //     ),
              //   ],
              // ),
              kWidthSizedBox,
              kWidthSizedBox,
              const HoverColorText(
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
