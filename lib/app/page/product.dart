import 'package:benji_frontend/app/responsive/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../utils/constant.dart';
import '../../widget/footer.dart';
import '../responsive/drawer/drawer.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              kSizedBox,
              kSizedBox,
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: breakPoint(media.width, 25, 50, 50),
                ),
                child: LayoutGrid(
                  columnSizes: breakPointDynamic(
                      media.width, [1.fr], [18.fr, 32.fr], [18.fr, 32.fr]),
                  rowSizes: const [
                    auto,
                    auto,
                  ],
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: breakPoint(media.width, 0, 20, 20)),
                      height: media.height * 0.5,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/product/item-3.png'),
                            fit: BoxFit.contain,
                          ),
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        deviceType(media.width) == 1
                            ? kSizedBox
                            : const SizedBox(),
                        const Row(
                          children: [
                            Icon(
                              Icons.spa,
                              color: kGreenColor,
                            ),
                            kHalfWidthSizedBox,
                            Expanded(
                              child: Text(
                                'Roast Beef Tenderloin',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        kHalfSizedBox,
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Meat',
                                style: TextStyle(
                                  color: kBlueColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Inclusive taxes',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: kGreenColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                        kSizedBox,
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                '\$20.00',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 30),
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Weight',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                'dummy',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                'dummy',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kGreenColor,
                                minimumSize: Size(
                                    breakPoint(
                                      media.width,
                                      media.width * 0.43,
                                      media.width * 0.27,
                                      media.width * 0.28,
                                    ),
                                    50),
                              ),
                              child: const Text('ADD TO CART'),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                foregroundColor: kGreenColor,
                                minimumSize: Size(
                                    breakPoint(
                                      media.width,
                                      media.width * 0.43,
                                      media.width * 0.27,
                                      media.width * 0.28,
                                    ),
                                    50),
                              ),
                              child: const Text('Add to Wishlist'),
                            ),
                          ],
                        ),
                      ],
                    )
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
