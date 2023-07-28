import 'package:benji_frontend/app/main/blogs.dart';
import 'package:benji_frontend/widget/responsive/appbar/appbar.dart';
import 'package:benji_frontend/widget/section/breadcrumb.dart';
import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../../widget/drawer/drawer.dart';
import '../../widget/section/footer.dart';

class BlogDetailsPage extends StatefulWidget {
  const BlogDetailsPage({super.key});

  @override
  State<BlogDetailsPage> createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends State<BlogDetailsPage> {
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
    const String image = 'assets/blog/blog-1.jpeg';
    const String date = '1 July 2022';
    const String from = 'Admin';
    const String title =
        'The Ultimate Hangover Burger: Egg in a Hole Burger Grilled Cheese';
    const String description = ''';
    final String description =  'Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy The Ultimate Hangover Burger: Egg in a Hole Burger Grilled Cheese';
    final String description =  'Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy''';

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
                text: 'Blog Details',
                current: 'Blog Details',
                hasBeadcrumb: true,
                back: 'Blog',
                backNav: BlogsPage(),
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
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: AssetImage(image),
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
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(date),
                                Expanded(
                                  child: Text(
                                    'Post by: $from',
                                    textAlign: TextAlign.end,
                                    softWrap: false,
                                    maxLines: 3,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            kHalfSizedBox,
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                title,
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
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                description,
                                softWrap: false,
                                maxLines: 5,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            kSizedBox,
                            kSizedBox,
                          ],
                        ),
                      ),
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
