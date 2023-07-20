import 'package:benji_frontend/utils/constant.dart';
import 'package:benji_frontend/widget/fancy_text.dart';
import 'package:benji_frontend/widget/hero.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant.dart' as constant;
import '../../widget/button.dart';
import '../../widget/circle_card.dart';
import '../../widget/image_card.dart';
import '../../widget/product_card.dart';
import '../responsive/appbar/laptop_appbar.dart';
import '../responsive/appbar/mobile_appbar.dart';
import '../responsive/appbar/tablet_appbar.dart';
import '../responsive/drawer/drawer.dart';
import '../responsive/layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController buttonCarouselController = CarouselController();
  bool visible = true;

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
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      backgroundColor: const Color(0xfffafafc),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, media.height * 0.11),
        child: const MyLayout(
          mobile: MyMobileAppBar(),
          tablet: MyTabletAppBar(),
          laptop: MyLaptopAppBar(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            CarouselSlider(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: true,
                height: media.width > 1000
                    ? media.height
                    : media.width > 600
                        ? media.width * 0.70
                        : media.width * 0.90,
                viewportFraction: 1.0,
                padEnds: false,
              ),
              items: [
                MyHero(
                  image: 'assets/hero/slider-1.png',
                  text1: 'Start Your Grocery Business',
                  text2: 'Stay Home & Delivered Your Daily Needs',
                  buttonCarouselController: buttonCarouselController,
                ),
                MyHero(
                  image: 'assets/hero/slider-2.png',
                  text1: 'Save up to 50% off on your first order',
                  text2: 'Don\'t Miss Amazing Grocery Deals',
                  buttonCarouselController: buttonCarouselController,
                ),
                MyHero(
                  image: 'assets/hero/slider-3.png',
                  text1: 'Save upto 30% off',
                  text2: 'Buy Fresh Groceries & Organic food',
                  buttonCarouselController: buttonCarouselController,
                  hasExplore: false,
                ),
              ],
            ),
            kSizedBox,
            kSizedBox,
            kSizedBox,
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: constant.breakPoint(
                  media.width,
                  25 - 13,
                  100 - 15,
                  100 - 15,
                ),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  // autoPlay: true,
                  height: MediaQuery.of(context).size.width *
                      constant.breakPoint(media.width, 0.3, 0.22, 0.16),
                  viewportFraction:
                      constant.breakPoint(media.width, 0.5, 0.5, 0.3333),
                  padEnds: false,
                ),
                items: const [
                  MyImageCard(
                    image: 'assets/sale/banner-1.png',
                  ),
                  MyImageCard(image: 'assets/sale/banner-2.png'),
                  MyImageCard(image: 'assets/sale/banner-3.png'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: constant.breakPoint(media.width, 25, 100, 100),
                  vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyFancyText(text: 'Categories'),
                      MyOutlinedButton(),
                    ],
                  ),
                  kSizedBox,
                  CarouselSlider(
                    options: CarouselOptions(
                      // enableInfiniteScroll: false,
                      scrollPhysics: const BouncingScrollPhysics(),
                      // autoPlay: true,
                      // height: ,
                      aspectRatio:
                          constant.breakPoint(media.width, 16 / 9, 3.5, 5.4),
                      viewportFraction:
                          constant.breakPoint(media.width, 1 / 2, 1 / 4, 1 / 6),
                      padEnds: false,
                    ),
                    items: const [
                      MyCicleCard(
                          image: 'assets/circle_card/category-1.jpg',
                          text: 'Snacks'),
                      MyCicleCard(
                          image: 'assets/circle_card/category-2.jpg',
                          text: 'Snacks'),
                      MyCicleCard(
                          image: 'assets/circle_card/category-3.jpg',
                          text: 'Snacks'),
                      MyCicleCard(
                          image: 'assets/circle_card/category-4.jpg',
                          text: 'Snacks'),
                      MyCicleCard(
                          image: 'assets/circle_card/category-5.jpg',
                          text: 'Snacks'),
                      MyCicleCard(
                          image: 'assets/circle_card/category-6.jpg',
                          text: 'Snacks'),
                    ],
                  ),
                  kSizedBox,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyFancyText(text: 'Trending'),
                      MyOutlinedButton(),
                    ],
                  ),
                  kSizedBox,
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          constant.breakPoint(media.width, 1, 2, 4).toInt(),
                      childAspectRatio: constant.breakPoint(media.width, 0.65,
                          0.60, 0.55), // Number of columns in the grid
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return const MyCard(); // Replace with your actual card widget
                    },
                    itemCount: 8, // Total number of items in the grid
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // Prevent scrolling of the grid
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 5,
              child: Image.asset(
                'assets/banner/banner-1.png',
                fit: BoxFit.cover,
              ),
            ),
            kSizedBox,
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: constant.breakPoint(media.width, 25, 100, 100),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyFancyText(text: 'Today\'s Special'),
                        MyOutlinedButton(),
                      ],
                    ),
                  ),
                  kSizedBox,
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          constant.breakPoint(media.width, 1, 2, 4).toInt(),
                      childAspectRatio: constant.breakPoint(media.width, 0.65,
                          0.60, 0.55), // Number of columns in the grid
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return const MyCard(); // Replace with your actual card widget
                    },
                    itemCount: 8, // Total number of items in the grid
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // Prevent scrolling of the grid
                  ),
                ],
              ),
            ),
            kSizedBox,
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  // autoPlay: true,
                  height: MediaQuery.of(context).size.width *
                      constant.breakPoint(media.width, 0.5, 0.44, 0.24),
                  viewportFraction:
                      constant.breakPoint(media.width, 0.5, 0.5, 1 / 4),
                  padEnds: false,
                ),
                items: const [
                  MyImageCard(
                    image: 'assets/mid_paragraph/banner-1.png',
                  ),
                  MyImageCard(image: 'assets/mid_paragraph/banner-2.png'),
                  MyImageCard(image: 'assets/mid_paragraph/banner-3.png'),
                  MyImageCard(image: 'assets/mid_paragraph/banner-3.png'),
                ],
              ),
            ),
            kSizedBox,
            kSizedBox,
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: constant.breakPoint(media.width, 25, 100, 100),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyFancyText(text: 'Recommended'),
                        MyOutlinedButton(),
                      ],
                    ),
                  ),
                  kSizedBox,
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          constant.breakPoint(media.width, 1, 2, 4).toInt(),
                      childAspectRatio: constant.breakPoint(media.width, 0.65,
                          0.60, 0.55), // Number of columns in the grid
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return const MyCard(); // Replace with your actual card widget
                    },
                    itemCount: 8, // Total number of items in the grid
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // Prevent scrolling of the grid
                  ),
                ],
              ),
            ),
            kSizedBox,
            kSizedBox,
            AspectRatio(
              aspectRatio: 5,
              child: Image.asset(
                'assets/banner/banner-2.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/paragraph_bg/mobile_app_bg.png'),
                    fit: BoxFit.cover),
              ),
              child: SizedBox(
                height: 500,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 2,
                  crossAxisCount: 2,
                  children: [
                    Image.asset(
                      'assets/device/mobile_app_1.png',
                      fit: BoxFit.cover,
                    ),
                    const Text('please work'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: const MyDrawer(),
    );
  }
}
