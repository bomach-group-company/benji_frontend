import 'package:benji_frontend/app/store/product.dart';
import 'package:benji_frontend/widget/responsive/appbar/appbar.dart';
import 'package:benji_frontend/widget/section/breadcrumb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../utils/constant.dart';
import '../../model/all_product.dart';
import '../../model/category.dart';
import '../../model/product.dart';
import '../../widget/cards/product_card.dart';
import '../../widget/cards/product_card_lg.dart';
import '../../widget/drawer/drawer.dart';
import '../../widget/section/footer.dart';

class CategoryPage extends StatefulWidget {
  final String activeCategories;
  const CategoryPage({super.key, this.activeCategories = 'All'});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;
  String activeCategories = '';

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

    activeCategories = widget.activeCategories;

    super.initState();
  }

  bool showCard = false;
  String productPopId = '';

  Future<Map<String, dynamic>> _getData() async {
    AllProduct data = await fetchAllProduct(0);
    List<Product> everyProduct = data.items;

    for (var i = 1; i < data.total; i++) {
      data = await fetchAllProduct(0);
      everyProduct += data.items;
    }

    List<Category> categories = await fetchCategories();
    List listCategory = ['All'] + categories.map((item) => item.name).toList();
    return {'products': everyProduct, 'categories': listCategory};
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
          future: _getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return const SpinKitChasingDots(
                color: kGreenColor,
                size: 30,
              );
            } else {
              return Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const MyBreadcrumb(
                          text: 'Products',
                          current: 'Products',
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
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: (snapshot.data['categories']
                                                as List)
                                            .map((item) {
                                          return Row(
                                            children: [
                                              OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                  minimumSize:
                                                      const Size(10, 50),
                                                  backgroundColor:
                                                      activeCategories == item
                                                          ? kGreenColor
                                                          : Colors.white,
                                                  foregroundColor:
                                                      activeCategories == item
                                                          ? Colors.white
                                                          : kGreenColor,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    activeCategories = item;
                                                  });
                                                },
                                                child: Text(item),
                                              ),
                                              kHalfWidthSizedBox,
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  kSizedBox,
                                  Builder(builder: (context) {
                                    List<Product> data;
                                    if (activeCategories != 'All') {
                                      data = (snapshot.data['products']
                                              as List<Product>)
                                          .where((element) =>
                                              element.subCategoryId.category
                                                  .name ==
                                              activeCategories)
                                          .toList();
                                    } else {
                                      data = snapshot.data['products'];
                                    }
                                    return LayoutGrid(
                                      columnSizes: breakPointDynamic(
                                          media.width,
                                          [1.fr],
                                          [1.fr, 1.fr],
                                          [1.fr, 1.fr, 1.fr, 1.fr]),
                                      rowSizes: List.filled(data.length, auto),
                                      children: (data)
                                          .map((item) => MyCard(
                                                navigate:
                                                    ProductPage(id: item.id),
                                                action: () {
                                                  setState(() {
                                                    showCard = true;
                                                    productPopId = item.id;
                                                  });
                                                },
                                                image:
                                                    '$mediaBaseUrl${item.productImage}',
                                                title: item.name,
                                                sub: item.subCategoryId.name,
                                                price: item.price.toString(),
                                              ))
                                          .toList(),
                                    );
                                  }),
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
                  Builder(builder: (context) {
                    Product data = snapshot.data['products'].firstWhere(
                      (element) => element.id == productPopId,
                      orElse: () =>
                          (snapshot.data['products'].first as Product),
                    );
                    return MyCardLg(
                      navigate: ProductPage(id: data.id),
                      visible: showCard,
                      close: () {
                        setState(() {
                          showCard = false;
                        });
                      },
                      image: '$mediaBaseUrl${data.productImage}',
                      title: data.name,
                      sub: data.subCategoryId.name,
                      price: data.price.toString(),
                      description: data.description,
                    );
                  }),
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
