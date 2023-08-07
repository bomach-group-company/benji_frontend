import 'package:benji_frontend/app/store/category.dart';
import 'package:benji_frontend/widget/clickable.dart';
import 'package:benji_frontend/widget/responsive/appbar/appbar.dart';
import 'package:benji_frontend/widget/section/breadcrumb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../model/category.dart';
import '../../utils/constant.dart';
import '../../widget/cards/circle_card.dart';
import '../../widget/drawer/drawer.dart';
import '../../widget/section/footer.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
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
        child: FutureBuilder(
          future: fetchCategories(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Error occured refresh'),
                );
              }
              return const SpinKitChasingDots(
                color: kGreenColor,
                size: 30,
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      controller: _scrollController,
                      children: [
                        const MyBreadcrumb(
                          text: 'Categories',
                          current: 'Categories',
                          hasBeadcrumb: true,
                          back: 'home',
                        ),
                        kSizedBox,
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: breakPoint(media.width, 25, 50, 50),
                          ),
                          child: Wrap(
                            children: (snapshot.data as List<Category>)
                                .map(
                                  (item) => MyClickable(
                                    navigate: CategoryPage(
                                      activeCategoriesId: item.id,
                                      activeCategories: item.name,
                                    ),
                                    child: SizedBox(
                                      height: 220,
                                      width: 200,
                                      child: MyCicleCard(
                                        image:
                                            'assets/circle_card/category-1.jpg',
                                        text: item.name.toString(),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
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
              );
            }
          },
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
