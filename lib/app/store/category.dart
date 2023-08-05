import 'package:benji_frontend/app/store/categories.dart';
import 'package:benji_frontend/app/store/product.dart';
import 'package:benji_frontend/widget/responsive/appbar/appbar.dart';
import 'package:benji_frontend/widget/section/breadcrumb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../utils/constant.dart';
import '../../model/all_product.dart';
import '../../model/all_sub_category.dart';
import '../../model/product.dart';
import '../../widget/cards/product_card.dart';
import '../../widget/cards/product_card_lg.dart';
import '../../widget/drawer/drawer.dart';
import '../../widget/section/footer.dart';

class CategoryPage extends StatefulWidget {
  final String activeCategories;
  final String activeCategoriesId;
  final String activeSubCategories;
  final String activeSubCategoriesId;
  const CategoryPage({
    super.key,
    required this.activeCategories,
    required this.activeCategoriesId,
    this.activeSubCategories = 'All',
    this.activeSubCategoriesId = '',
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;
  String activeSubCategories = '';
  String activeSubCategoriesId = '';

  bool showCard = false;

  String productPopId = '';
  List<Product>? _getDataList;

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

    activeSubCategories = widget.activeSubCategories;
    activeSubCategoriesId = widget.activeSubCategoriesId;

    super.initState();
    _getData();
  }

  _getData() async {
    try {
      AllProduct data;
      if (activeSubCategories == 'All' && activeSubCategoriesId == '') {
        data = await fetchAllProductFilterByCategory(
            widget.activeCategoriesId, 1, 13);

        setState(() {
          _getDataList = data.items;
        });
      } else {
        data = await fetchAllProductFilterBySubCategory(
            activeSubCategoriesId, 1, 13);
        setState(() {
          _getDataList = data.items;
        });
      }
    } catch (e) {}
  }

  Future<List<List<String>>> _getSubCategory() async {
    AllSubCatogory data =
        await fetchSubCategoriesFilterByCategory(widget.activeCategoriesId);
    return [
          ['', 'All']
        ] +
        data.items.map((item) => [item.id, item.name]).toList();
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
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyBreadcrumb(
                    text: widget.activeCategories,
                    current: widget.activeCategories,
                    hasBeadcrumb: true,
                    back: 'categories',
                    backNav: const CategoriesPage(),
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
                            FutureBuilder(
                                future: _getSubCategory(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return Row(
                                      children: [
                                        OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            minimumSize: const Size(10, 50),
                                            backgroundColor: kGreenColor,
                                            foregroundColor: Colors.white,
                                          ),
                                          onPressed: () {},
                                          child: const SpinKitCircle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: (snapshot.data
                                                  as List<List<String>>)
                                              .map((item) {
                                            return Row(
                                              children: [
                                                OutlinedButton(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    minimumSize:
                                                        const Size(10, 50),
                                                    backgroundColor:
                                                        activeSubCategoriesId ==
                                                                item[0]
                                                            ? kGreenColor
                                                            : Colors.white,
                                                    foregroundColor:
                                                        activeSubCategoriesId ==
                                                                item[0]
                                                            ? Colors.white
                                                            : kGreenColor,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      activeSubCategories =
                                                          item[1];
                                                      activeSubCategoriesId =
                                                          item[0];
                                                      _getDataList = null;
                                                      _getData();
                                                    });
                                                  },
                                                  child: Text(item[1]),
                                                ),
                                                kHalfWidthSizedBox,
                                              ],
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    );
                                  }
                                }),
                            kSizedBox,
                            Builder(builder: (context) {
                              if (_getDataList == null) {
                                return const SpinKitChasingDots(
                                  color: kGreenColor,
                                  size: 30,
                                );
                              } else {
                                return Column(
                                  children: [
                                    LayoutGrid(
                                      columnSizes: breakPointDynamic(
                                          media.width,
                                          [1.fr],
                                          [1.fr, 1.fr],
                                          [1.fr, 1.fr, 1.fr, 1.fr]),
                                      rowSizes: List.filled(
                                          _getDataList!.length, auto),
                                      children: (_getDataList!)
                                          .map((item) => MyCard(
                                                navigateCategory: CategoryPage(
                                                  activeSubCategories:
                                                      item.subCategoryId.name,
                                                  activeSubCategoriesId:
                                                      item.subCategoryId.id,
                                                  activeCategoriesId: item
                                                      .subCategoryId
                                                      .category
                                                      .id,
                                                  activeCategories: item
                                                      .subCategoryId
                                                      .category
                                                      .name,
                                                ),
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
                                    ),
                                  ],
                                );
                              }
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
              if (_getDataList == null) {
                return const Text('');
              } else {
                Product data = (_getDataList!).firstWhere(
                  (element) => element.id == productPopId,
                  orElse: () => (_getDataList!).first,
                );
                return MyCardLg(
                  navigateCategory: CategoryPage(
                    activeSubCategories: data.subCategoryId.name,
                    activeSubCategoriesId: data.subCategoryId.id,
                    activeCategoriesId: data.subCategoryId.category.id,
                    activeCategories: data.subCategoryId.category.name,
                  ),
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
              }
            }),
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
