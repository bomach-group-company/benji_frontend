import 'package:benji_frontend/app/main/about.dart';
import 'package:benji_frontend/app/main/contact_us.dart';
import 'package:benji_frontend/app/main/home.dart';
import 'package:benji_frontend/model/category.dart';
import 'package:flutter/material.dart';

import '../../app/auth/login.dart';
import '../../utils/constant.dart';
import '../drop.dart';
import '../text/hover_text.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool visible = false;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCategories(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Drawer(
          elevation: 20,
          shadowColor: Colors.red,
          backgroundColor: const Color(0xfffafafc),
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: 20, top: 20, left: 16),
                      child: Row(
                        children: [
                          IconButton(
                            splashRadius: 20,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close_sharp,
                              color: kGreenColor,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: const HoverColorText(
                              navigate: HomePage(),
                              text: 'Home',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: const HoverColorText(
                              navigate: AboutPage(),
                              text: 'About',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        visible = !visible;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'Menu',
                                          style: TextStyle(
                                            color: isHovered
                                                ? kGreenColor
                                                : Colors.black,
                                            fontWeight: FontWeight.w200,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: isHovered
                                              ? kGreenColor
                                              : Colors.black,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                kHalfSizedBox,
                                Builder(builder: (context) {
                                  return snapshot.hasData
                                      ? MyDropDown(
                                          visible: visible,
                                          items:
                                              (snapshot.data as List<Category>)
                                                  .map((item) => item)
                                                  .toList(),
                                        )
                                      : const SizedBox();
                                }),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: const HoverColorText(
                              navigate: ContactUs(),
                              text: 'Help & Contact Us',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // login button
              Container(
                padding: const EdgeInsets.only(
                    bottom: 20, top: 20, left: 16, right: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kGreenColor,
                    minimumSize: const Size(double.infinity, 50),
                  ),
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
              ),
            ],
          ),
        );
      },
    );
  }
}
