import 'package:benji_frontend/app/page/main/home.dart';
import 'package:benji_frontend/utils/constant.dart';
import 'package:benji_frontend/widget/clickable.dart';
import 'package:flutter/material.dart';

class MyBreadcrumb extends StatefulWidget {
  final String text;
  final bool hasBeadcrumb;
  final String? back;
  final Widget? backNav;
  final String? current;
  const MyBreadcrumb({
    super.key,
    required this.text,
    this.hasBeadcrumb = false,
    this.current,
    this.back,
    this.backNav = const HomePage(),
  });

  @override
  State<MyBreadcrumb> createState() => _MyBreadcrumbState();
}

class _MyBreadcrumbState extends State<MyBreadcrumb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/paragraph_bg/breadcrumb_bg_image.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w600,
                color: kBlueColor,
              ),
            ),
            widget.hasBeadcrumb
                ? Column(
                    children: [
                      kSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyClickable(
                            navigate: widget.backNav,
                            child: Text(
                              widget.back ?? "home",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          kHalfWidthSizedBox,
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey,
                            size: 12,
                          ),
                          kHalfWidthSizedBox,
                          Text(
                            widget.current ?? "Home",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
