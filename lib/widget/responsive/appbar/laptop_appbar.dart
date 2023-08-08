import 'package:benji_frontend/app/main/home.dart';
import 'package:benji_frontend/widget/clickable.dart';
import 'package:flutter/material.dart';

import '../../../app/auth/login.dart';
import '../../../app/main/contact_us.dart';
import '../../../app/store/category.dart';
import '../../../app/store/search.dart';
import '../../../model/category.dart';
import '../../../utils/constant.dart';
import '../../text/hover_text.dart';

class MyLaptopAppBar extends StatefulWidget {
  const MyLaptopAppBar({super.key});

  @override
  State<MyLaptopAppBar> createState() => _MyLaptopAppBarState();
}

class _MyLaptopAppBarState extends State<MyLaptopAppBar> {
  bool visible = false;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return FutureBuilder(
        future: fetchCategories(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(
                vertical: 0, horizontal: media.width * 0.07),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  color: Colors.grey,
                  blurRadius: 1,
                  spreadRadius: 1,
                )
              ],
              color: Color(0xfffafafc),
              // border: Border(
              //   bottom: BorderSide(color: kGreenColor, width: 1),
              // ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyClickable(
                  navigate: const HomePage(),
                  child: Image.asset(
                    'assets/brand/benji-logo-resized-nobg.png',
                    // fit: BoxFit.cover,
                  ),
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
                    ),
                    kWidthSizedBox,
                    kWidthSizedBox,
                    PopupMenuButton(
                      offset: const Offset(0, -25),
                      shadowColor: Colors.grey,
                      constraints:
                          const BoxConstraints(maxHeight: 170, maxWidth: 200),
                      tooltip: '',
                      position: PopupMenuPosition.under,
                      elevation: 5,
                      splashRadius: 0,
                      child: Center(
                        child: Row(
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              onEnter: (_) {
                                setState(() {
                                  isHovered = true;
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  isHovered = false;
                                });
                              },
                              child: Text(
                                'Menu',
                                style: TextStyle(
                                  color: isHovered ? kGreenColor : Colors.black,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: isHovered ? kGreenColor : Colors.black,
                            )
                          ],
                        ),
                      ),
                      itemBuilder: (context) {
                        return List.generate((snapshot.data as List).length,
                                (index) => index)
                            .map(
                              (item) => PopupMenuItem<int>(
                                value: item,
                                child: Text(
                                    (snapshot.data as List<Category>)[item]
                                        .name),
                              ),
                            )
                            .toList();
                      },
                      onSelected: (value) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => CategoryPage(
                              activeCategoriesId:
                                  (snapshot.data as List<Category>)[value].id,
                              activeCategories:
                                  (snapshot.data as List<Category>)[value].name,
                            ),
                          ),
                        );
                      },
                    ),
                    kWidthSizedBox,
                    kWidthSizedBox,
                    const HoverColorText(
                      navigate: ContactUs(),
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
                    const MyClickable(
                      navigate: SearchPage(),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    kWidthSizedBox,
                    const Text(
                      '|',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    kWidthSizedBox,
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Icon(Icons.shopping_cart, color: Colors.black),
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
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginPage();
                            },
                          ),
                        );
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
