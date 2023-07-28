import 'package:benji_frontend/app/store/category.dart';
import 'package:benji_frontend/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../app/store/product.dart';
import '../clickable.dart';

class MyCard extends StatefulWidget {
  final String image;
  final String title;
  final String sub;
  final String price;
  final Widget? navigate;
  final Widget? navigateCategory;

  const MyCard({
    super.key,
    required this.image,
    required this.title,
    required this.sub,
    required this.price,
    this.navigate = const ProductPage(),
    this.navigateCategory = const CategoryPage(),
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  double blurRadius = 2;
  double margin = 15;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          blurRadius = 20;
          margin = 10;
        });
      },
      onExit: (event) {
        setState(() {
          blurRadius = 2;
          margin = 15;
        });
      },
      child: AnimatedContainer(
        curve: Curves.bounceInOut,
        margin: EdgeInsets.all(margin),
        duration: const Duration(microseconds: 200000),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: const Border.fromBorderSide(
            BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: blurRadius,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: MyClickable(
                navigate: widget.navigate,
                child: Center(child: Image.asset(widget.image)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 18,
                          width: 18,
                          child: Image.asset(
                            'assets/product_asset/veg.png',
                          ),
                        ),
                        kHalfWidthSizedBox,
                        Expanded(
                          child: MyClickable(
                            navigate: widget.navigate,
                            child: Text(
                              widget.title,
                              softWrap: false,
                              maxLines: 1,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyClickable(
                          navigate: widget.navigateCategory,
                          child: Text(
                            widget.sub,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: kGreenColor,
                                fontSize: 13,
                                height: 2),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$${widget.price}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: kGreenColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 15),
                          ),
                          onPressed: () {},
                          child: const Text('ADD'),
                        ),
                      ],
                    ),
                    kHalfSizedBox
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
