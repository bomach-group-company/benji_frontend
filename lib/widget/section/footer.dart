import 'package:benji_frontend/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/main/about.dart';
import '../../app/main/blogs.dart';
import '../../app/main/contact_us.dart';
import '../../app/main/faqs.dart';
import '../../app/main/privacy_policy.dart';
import '../../app/main/term_condition.dart';
import '../footer_column_text.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: breakPoint(
              media.width,
              20,
              responsiveSize(
                  size: media.width, points: [50, 100, 100, 100, 100]),
              80)),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/footer/footer_bg_1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          LayoutGrid(
            columnSizes:
                breakPointDynamic(media.width, [1.fr], [1.fr], [1.fr, 2.fr]),
            rowSizes: const [auto, auto],
            rowGap: 40,
            columnGap: 24,
            children: [
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/brand/logo.png',
                      fit: BoxFit.cover,
                      height: 80,
                    ),
                    kSizedBox,
                    Text(
                      'The Best Grocery Store in Your Town.',
                      style: GoogleFonts.oleoScript(
                          color: Colors.white,
                          fontSize: media.width * 0.035 + 20,
                          height: 1),
                    ),
                    kSizedBox,
                    const Text(
                      'Lorem ipsum dolor sit amet, ectetur adipiscing elit. Pharetra, a phasellus mattis mi arcu urna Pharetra, a phasellu Lorem ipsum dolor sit amet, ectetur adipiscing elit. Pharetra, a phasellus mattis mi arcu urna Pharetra, a phasellu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: breakPoint(media.width, 0, 0, 25),
                    right: breakPoint(media.width, 25, 0, 60)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FooterColumnText(
                          head: 'About Us',
                          items: [
                            ['About', AboutPage()],
                            ['Our Team', null],
                            ['Testimonials', null],
                            ['Today\'s Special', null]
                          ],
                        ),
                        FooterColumnText(
                          head: 'Legal',
                          items: [
                            ['Privacy Policy', PrivacyPolicyPage()],
                            ['Terms & Conditions', TermConditionPage()],
                            ['Refund Policy', null],
                          ],
                        ),
                        FooterColumnText(
                          head: 'Other pages',
                          items: [
                            ['FAQs', FAQsPage()],
                            ['Gallery', null],
                            ['Contact us', ContactUs()],
                            ['Blogs', BlogsPage()]
                          ],
                        ),
                      ],
                    ),
                    kSizedBox,
                    kSizedBox,
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints.loose(
                            const Size(90, 50),
                          ),
                          child: Image.asset('assets/store/playstore.png'),
                        ),
                        kWidthSizedBox,
                        Container(
                          constraints: BoxConstraints.loose(
                            const Size(90, 30),
                          ),
                          child: Image.asset('assets/store/appstore.png'),
                        ),
                      ],
                    ),
                    kSizedBox,
                    const Row(
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 40,
                        ),
                        kWidthSizedBox,
                        Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 40,
                        ),
                        kWidthSizedBox,
                        Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                    kSizedBox,
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: const Color(0xffdc3545).withOpacity(0.2),
          ),
          Text(
            'Copyright @ 2023 . All rights reserved',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: breakPoint(media.width, 14, 15, 17),
            ),
          ),
        ],
      ),
    );
  }
}
