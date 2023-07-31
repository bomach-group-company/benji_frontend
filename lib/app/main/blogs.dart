import 'package:benji_frontend/widget/responsive/appbar/appbar.dart';
import 'package:benji_frontend/widget/section/breadcrumb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../utils/constant.dart';
import '../../widget/cards/blog_card.dart';
import '../../widget/section/footer.dart';
import '../../widget/drawer/drawer.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({super.key});

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
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
              const MyBreadcrumb(
                text: 'Blogs',
                current: 'Blogs',
                hasBeadcrumb: true,
                back: 'home',
              ),
              kSizedBox,
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: breakPoint(media.width, 25, 50, 50)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LayoutGrid(
                      columnSizes: breakPointDynamic(media.width, [1.fr],
                          [1.fr, 1.fr], [1.fr, 1.fr, 1.fr]),
                      rowSizes: const [
                        auto,
                        auto,
                        auto,
                        auto,
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
                        MyBlogCard(
                          date: '1 July 2022',
                          from: 'Admin',
                          title:
                              'The Ultimate Hangover Burger: Egg in a Hole Burger Grilled Cheese',
                          image: 'assets/blog/blog-1.jpeg',
                          description:
                              'Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy',
                        ),
                        MyBlogCard(
                          date: '1 July 2022',
                          from: 'Admin',
                          title:
                              'The Ultimate Hangover Burger: Egg in a Hole Burger Grilled Cheese',
                          image: 'assets/blog/blog-2.jpeg',
                          description:
                              'Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy',
                        ),
                        MyBlogCard(
                          date: '1 July 2022',
                          from: 'Admin',
                          title:
                              'The Ultimate Hangover Burger: Egg in a Hole Burger Grilled Cheese',
                          image: 'assets/blog/blog-1.jpeg',
                          description:
                              'Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy',
                        ),
                        MyBlogCard(
                          date: '1 July 2022',
                          from: 'Admin',
                          title:
                              'The Ultimate Hangover Burger: Egg in a Hole Burger Grilled Cheese',
                          image: 'assets/blog/blog-1.jpeg',
                          description:
                              'Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy',
                        ),
                        MyBlogCard(
                          date: '1 July 2022',
                          from: 'Admin',
                          title:
                              'The Ultimate Hangover Burger: Egg in a Hole Burger Grilled Cheese',
                          image: 'assets/blog/blog-1.jpeg',
                          description:
                              'Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy',
                        ),
                        MyBlogCard(
                          date: '1 July 2022',
                          from: 'Admin',
                          title:
                              'The Ultimate Hangover Burger: Egg in a Hole Burger Grilled Cheese',
                          image: 'assets/blog/blog-1.jpeg',
                          description:
                              'Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy',
                        ),
                        MyBlogCard(
                          date: '1 July 2022',
                          from: 'Admin',
                          title:
                              'The Ultimate Hangover Burger: Egg in a Hole Burger Grilled Cheese',
                          image: 'assets/blog/blog-1.jpeg',
                          description:
                              'Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy',
                        ),
                        MyBlogCard(
                          date: '1 July 2022',
                          from: 'Admin',
                          title:
                              'The Ultimate Hangover Burger: Egg in a Hole Burger Grilled Cheese',
                          image: 'assets/blog/blog-1.jpeg',
                          description:
                              'Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy',
                        ),
                        MyBlogCard(
                          date: '1 July 2022',
                          from: 'Admin',
                          title:
                              'The Ultimate Hangover Burger: Egg in a Hole Burger Grilled Cheese',
                          image: 'assets/blog/blog-1.jpeg',
                          description:
                              'Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy',
                        ),
                        MyBlogCard(
                          date: '1 July 2022',
                          from: 'Admin',
                          title:
                              'The Ultimate Hangover Burger: Egg in a Hole Burger Grilled Cheese',
                          image: 'assets/blog/blog-1.jpeg',
                          description:
                              'Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy',
                        ),
                        MyBlogCard(
                          date: '1 July 2022',
                          from: 'Admin',
                          title:
                              'The Ultimate Hangover Burger: Egg in a Hole Burger Grilled Cheese',
                          image: 'assets/blog/blog-1.jpeg',
                          description:
                              'Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy ipsum text. Lorem is dummy',
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
