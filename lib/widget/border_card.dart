import 'package:benji_frontend/utils/constant.dart';
import 'package:flutter/material.dart';

class MyBorderCard extends StatefulWidget {
  const MyBorderCard({super.key});

  @override
  State<MyBorderCard> createState() => _MyBorderCardState();
}

class _MyBorderCardState extends State<MyBorderCard> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      width: deviceType(media.width) <= 2
          ? media.width * 0.9
          : responsiveNumberSize(media.width, [
              media.width * 0.30,
              media.width * 0.30,
              media.width * 0.25,
              media.width * 0.25,
              media.width * 0.25,
            ]),

      // margin: const EdgeInsets.symmetric(
      //   horizontal: 10,
      // ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      // height: 100,
      // width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.car_crash_outlined,
            color: kGreenColor,
            size: 50,
          ),
          kHalfWidthSizedBox,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Live Order Tracking',
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 150,
                child: Text(
                  'Live Order Tracking Lorem ipsum dolor sit amet, consectetur',
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
