import 'package:benji_frontend/utils/constant.dart';
import 'package:flutter/material.dart';

class MyBlogCard extends StatefulWidget {
  const MyBlogCard({super.key});

  @override
  State<MyBlogCard> createState() => _MyBlogCardState();
}

class _MyBlogCardState extends State<MyBlogCard> {
  double blurRadius = 2;
  double margin = 15;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          blurRadius = 20;
          margin = 10;
        });
      },
      onExit: (event) {
        setState(() {
          blurRadius = 2;
          margin = 15;
        });
      },
      child: AnimatedContainer(
        curve: Curves.bounceInOut,
        margin: EdgeInsets.all(margin),
        duration: const Duration(microseconds: 200000),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: const Border.fromBorderSide(
            BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: blurRadius,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/blog/blog-2.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: double.infinity,
              ),
            ),
            kSizedBox,
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('1 July 2022'),
                          Text('Post by: Admin'),
                        ],
                      ),
                      kHalfSizedBox,
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'The Ultimate Hangover Burger: Egg in a Hole Burger The Ultimate Hangover Burger',
                          softWrap: false,
                          maxLines: 2,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      kSizedBox,
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy fbb dfbdbn dbnbn ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy fbb dfbdbn dbnbn',
                          softWrap: false,
                          maxLines: 5,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      kSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kGreenColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 15,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Read More',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      kSizedBox,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
