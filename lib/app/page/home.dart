import 'package:benji_frontend/utils/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../responsive/appbar/l_appbar.dart';
import '../responsive/appbar/m_appbar.dart';
import '../responsive/appbar/t_appbar.dart';
import '../responsive/drawer/drawer.dart';
import '../responsive/layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      backgroundColor: Colors.green[100],
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, media.height * 0.11),
        child: const MyLayout(
          mobile: MyMAppBar(),
          tablet: MyTAppBar(),
          laptop: MyLAppBar(),
        ),
      ),
      body: SafeArea(
        child: CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: true,
            height: media.width > 1000
                ? media.height
                : media.width > 400
                    ? media.width * 0.75
                    : media.width * 1.2,
            viewportFraction: 1.0,
            padEnds: false,
          ),
          items: [1, 2, 3].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: media.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/hero/slider-$i.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: media.width > 800
                              ? 90
                              : media.width > 400
                                  ? 10
                                  : 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  buttonCarouselController.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                              ),
                              icon: const Icon(
                                Icons.arrow_back_ios_outlined,
                                color: Colors.white70,
                                size: 30,
                              ),
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Start Your Grocery Business',
                                  style: TextStyle(
                                    color: kGreenColor,
                                    fontSize: 50,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  'Stay Home & Delivered Your Daily Needs',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 70,
                                    fontWeight: FontWeight.w900,
                                  ),
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () =>
                                  buttonCarouselController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                              ),
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white70,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            );
          }).toList(),
        ),
      ),
      endDrawer: const MyDrawer(),
    );
  }
}
