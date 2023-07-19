import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../widget/text.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      shadowColor: Colors.red,
      backgroundColor: Colors.black,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 20, top: 20, left: 16),
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
                          text: 'Menu',
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
                          text: 'Help & Contact Us',
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
                          text: 'Cart',
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
                          text: 'Search',
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
            padding:
                const EdgeInsets.only(bottom: 20, top: 20, left: 16, right: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kGreenColor,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
