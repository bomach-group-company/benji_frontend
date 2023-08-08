import 'package:benji_frontend/widget/responsive/appbar/appbar.dart';
import 'package:benji_frontend/widget/section/breadcrumb.dart';
import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../../widget/drawer/drawer.dart';
import '../../widget/section/footer.dart';

class FAQsPage extends StatefulWidget {
  const FAQsPage({super.key});

  @override
  State<FAQsPage> createState() => _FAQsPageState();
}

class _FAQsPageState extends State<FAQsPage> {
  List items = [
    [
      'What is Benji?',
      'Benji is an advanced multi-vendor e-commerce and logistics app developed by the renowned Bomach Group in collaboration with Alpha Logistics. It is designed to revolutionize online shopping and seamless delivery of goods, offering a game-changing experience in the e-commerce and logistics industry.',
    ],
    [
      'How does Benji work?',
      'Benji brings together multiple vendors and their products on a single platform, providing users with a wide variety of options. Customers can browse through various products compare prices, and place orders directly through the app. The app advanced logistics system then facilitates efficient delivery of the purchased goods to the customers specified locations.',
    ],
    [
      'What are the key features of Benji?',
      'Benji boasts several innovative features, including a user-friendly interface, a diverse range of products from multiple vendors, real-time product tracking, secure payment options personalized recommendations, and a seamless and efficient delivery network.',
    ],
    [
      'Can I trust the vendors on Benji?',
      'Absolutely! Bomach Group and Alpha Logistics have carefully curated and on-boarded vendors to ensure the highest quality and credibility. Vendors are thoroughly vetted before being allowed to list their products on the platform. Additionally, user reviews and ratings contribute to building a trustworthy and reliable shopping experience.',
    ],
    [
      'What sets Benji apart from other e-commerce apps?',
      'Benji key differentiator lies in its seamless integration of e-commerce and logistics. Unlike traditional e-commerce apps, Benji partnership with Alpha Logistics ensures quick and reliable deliveries, reducing the risk of delays and order mishaps. The app ability to handle multiple vendors also provides users with an extensive selection of products, all in one place.',
    ],
    [
      'Is my payment information safe on Benji?',
      'Absolutely. Benji employs state-of-the-art encryption and security protocols to safeguard your payment information. Your financial data is protected at all times, ensuring a secure and worry-free shopping experience.',
    ],
  ];

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

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      drawerScrimColor: Colors.transparent,
      backgroundColor: const Color(0xfffafafc),
      appBar: const MyAppbar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                children: [
                  const MyBreadcrumb(
                    text: 'FAQs',
                    current: 'faqs',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: items.map((item) {
                            return Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1,
                                    )
                                  ]),
                                  child: ExpansionTile(
                                    iconColor: Colors.black45,
                                    collapsedBackgroundColor: Colors.white,
                                    backgroundColor: Colors.white30,
                                    title: Text(
                                      item[0],
                                      style: const TextStyle(
                                        color: kBlueColor,
                                      ),
                                    ),
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          border: Border.symmetric(
                                            horizontal: BorderSide(
                                              width: 1,
                                              color: Colors.black12,
                                            ),
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(20),
                                        width: double.infinity,
                                        child: Text(item[1]),
                                      )
                                    ],
                                  ),
                                ),
                                kSizedBox,
                              ],
                            );
                          }).toList(),
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
          ],
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
