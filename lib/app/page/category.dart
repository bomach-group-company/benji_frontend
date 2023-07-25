import 'package:benji_frontend/app/responsive/appbar/appbar.dart';
import 'package:benji_frontend/widget/breadcrumb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../utils/constant.dart';
import '../../widget/footer.dart';
import '../../widget/product_card.dart';
import '../responsive/drawer/drawer.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true;
          } else {
            _showBackToTopButton = false;
          }
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  List<bool> expanded = [false, false];
  List<String> subCategories = ['All', 'Chicken', 'Goat'];
  String activeSubCategories = 'All';

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      drawerScrimColor: Colors.transparent,
      backgroundColor: const Color(0xfffafafc),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, media.height * 0.11),
        child: const MyAppbar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const MyBreadcrumb(
                text: 'Meat',
                current: 'Meat',
                hasBeadcrumb: true,
                back: 'home',
              ),
              kSizedBox,
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: breakPoint(media.width, 25, 50, 50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // width: media.width * 1,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: subCategories.map((item) {
                                return Row(
                                  children: [
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: const Size(10, 50),
                                        backgroundColor:
                                            activeSubCategories == item
                                                ? kGreenColor
                                                : Colors.white,
                                        foregroundColor:
                                            activeSubCategories == item
                                                ? Colors.white
                                                : kGreenColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          activeSubCategories = item;
                                        });
                                      },
                                      child: Text(item),
                                    ),
                                    kHalfWidthSizedBox,
                                  ],
                                );
                              }
                                  // OutlinedButton(
                                  //   style: OutlinedButton.styleFrom(
                                  //     minimumSize: const Size(10, 50),
                                  //     backgroundColor: Colors.white,
                                  //     foregroundColor: kGreenColor,
                                  //   ),
                                  //   onPressed: () {},
                                  //   child: const Text('Chicken'),
                                  // ),
                                  ).toList(),
                            ),
                          ),
                        ),
                        kSizedBox,
                        LayoutGrid(
                          columnSizes: breakPointDynamic(media.width, [1.fr],
                              [1.fr, 1.fr], [1.fr, 1.fr, 1.fr, 1.fr]),
                          rowSizes: const [
                            auto,
                            auto,
                            auto,
                            auto,
                            auto,
                            auto,
                            auto,
                            auto
                          ],
                          children: const [
                            MyCard(
                              image: 'assets/product/item-1.jpg',
                              title: 'Parle Rusk, Elaichi',
                              sub: 'Vegetable',
                              price: '50.00',
                            ),
                            MyCard(
                              image: 'assets/product/item-2.png',
                              title: 'Parle Rusk, Elaichi',
                              sub: 'Vegetable',
                              price: '50.00',
                            ),
                            MyCard(
                              image: 'assets/product/item-1.jpg',
                              title: 'Parle Rusk, Elaichi',
                              sub: 'Vegetable',
                              price: '50.00',
                            ),
                            MyCard(
                              image: 'assets/product/item-3.png',
                              title: 'Parle Rusk, Elaichi',
                              sub: 'Vegetable',
                              price: '50.00',
                            ),
                            MyCard(
                              image: 'assets/product/item-4.png',
                              title: 'Parle Rusk, Elaichi',
                              sub: 'Vegetable',
                              price: '50.00',
                            ),
                            MyCard(
                              image: 'assets/product/item-1.jpg',
                              title: 'Parle Rusk, Elaichi',
                              sub: 'Vegetable',
                              price: '50.00',
                            ),
                            MyCard(
                              image: 'assets/product/item-1.jpg',
                              title: 'Parle Rusk, Elaichi',
                              sub: 'Vegetable',
                              price: '50.00',
                            ),
                            MyCard(
                              image: 'assets/product/item-1.jpg',
                              title: 'Parle Rusk, Elaichi',
                              sub: 'Vegetable',
                              price: '50.00',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              kSizedBox,
              kSizedBox,
              kSizedBox,
              const Footer(),
            ],
          ),
        ),
      ),
      endDrawer: const MyDrawer(),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  minimumSize: const Size(45, 45),
                  foregroundColor: kGreenColor,
                  side: const BorderSide(color: kGreenColor)),
              onPressed: _scrollToTop,
              child: const Icon(
                Icons.arrow_upward,
                size: 20,
                // color: Colors.white,
              ),
            ),
    );
  }
}
