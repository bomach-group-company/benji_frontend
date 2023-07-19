import 'package:benji_frontend/utils/constant.dart';
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key});

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
              offset: const Offset(0, 3), // changes the position of the shadow
            ),
          ],
        ),
        // margin: const EdgeInsets.symmetric(
        //   vertical: 8,
        //   horizontal: 15,
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Center(child: Image.asset('assets/product/item-3.png')),
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
                        const Expanded(
                          child: Text(
                            'Keya Italian Pizza Oregano',
                            softWrap: false,
                            maxLines: 1,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'Vegetable',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: kGreenColor,
                              fontSize: 13,
                              height: 2),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '\$50.00',
                          style: TextStyle(
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
