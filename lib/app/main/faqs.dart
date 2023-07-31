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
    ['FAQs 1', 'Answer 1'],
    ['FAQs 2', 'Answer 2'],
    ['FAQs 3', 'Answer 3']
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
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, media.height * 0.11),
        child: const MyAppbar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      children: items.map((e) {
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
                                title: const Text(
                                  "FAQ QUESTION ONE",
                                  style: TextStyle(
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
                                    child:
                                        const Text("Answers for Question One"),
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
