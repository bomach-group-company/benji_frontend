import 'package:benji_frontend/app/responsive/appbar/appbar.dart';
import 'package:benji_frontend/widget/breadcrumb.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../widget/footer.dart';
import '../../responsive/drawer/drawer.dart';

class TermConditionPage extends StatefulWidget {
  const TermConditionPage({super.key});

  @override
  State<TermConditionPage> createState() => _TermConditionPageState();
}

class _TermConditionPageState extends State<TermConditionPage> {
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
              const MyBreadcrumb(text: 'Terms & Conditions'),
              kSizedBox,
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lorem is Terms & Conditions',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff2d2942),
                        fontWeight: FontWeight.bold,
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
                          fontSize: 18, color: Color(0xff2d2942), height: 1.5),
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
