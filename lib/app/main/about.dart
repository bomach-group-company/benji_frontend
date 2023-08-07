import 'package:benji_frontend/widget/responsive/appbar/appbar.dart';
import 'package:benji_frontend/widget/section/breadcrumb.dart';
import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../../widget/drawer/drawer.dart';
import '../../widget/section/footer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool _showBackToTopButton = false;

  // scroll controller
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
                    text: 'About Us',
                    current: 'About Us',
                    hasBeadcrumb: true,
                    back: 'home',
                  ),
                  kSizedBox,
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: breakPoint(media.width, 25, 50, 50),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lorem is About content',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff2d2942),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        kSizedBox,
                        kHalfSizedBox,
                        Text(
                          '''Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. 
            Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. 
            Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. 
            Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. Lorem ispum is dummy text to type setting the industry. ''',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff2d2942),
                              height: 1.5),
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
              ),
            ),
    );
  }
}
