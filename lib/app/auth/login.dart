import 'package:benji_frontend/app/main/home.dart';
import 'package:benji_frontend/utils/constant.dart';
import 'package:benji_frontend/widget/clickable.dart';
import 'package:benji_frontend/widget/text/hover_text.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    constraints: BoxConstraints(minHeight: media.height),
                    // height: media.height * 1.5,
                    width: media.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/login/auth_bg_image.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        kSizedBox,
                        kSizedBox,
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 40),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                blurStyle: BlurStyle.outer,
                                color: Colors.grey.shade900,
                                offset: const Offset(0, 0),
                              )
                            ],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          width: breakPoint(
                              media.width, media.width * 0.85, 450, 450),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 95,
                                width: 95,
                                child: MyClickable(
                                  navigate: const HomePage(),
                                  child: Image.asset('assets/brand/logo.png'),
                                ),
                              ),
                              kSizedBox,
                              const Text(
                                'Single Grocery',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Divider(
                                height: 32,
                                color: kGreenColor,
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    kSizedBox,
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      cursorHeight: 20,
                                      cursorWidth: 1,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Email',
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please enter your name';
                                        }
                                        return null;
                                      },
                                    ),
                                    kSizedBox,
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      cursorHeight: 20,
                                      cursorWidth: 1,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Password',
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please enter your name';
                                        }
                                        return null;
                                      },
                                    ),
                                    kSizedBox,
                                    const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        HoverColorText(
                                          text: 'Forgot password?',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                    kHalfSizedBox,
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: Size(media.width, 40),
                                            backgroundColor: kGreenColor),
                                        onPressed: () {},
                                        child: const Text(
                                          'Login',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                    ),
                                    kSizedBox,
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40),
                                      child: const Row(
                                        children: [
                                          Expanded(
                                            child: DottedLine(
                                              dashGapLength: 2,
                                              dashLength: 2,
                                              dashColor: Colors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              'OR',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: DottedLine(
                                              dashGapLength: 2,
                                              dashLength: 2,
                                              dashColor: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    kSizedBox,
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: breakPoint(
                                              media.width, 20, 100, 100)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                              'assets/login/facebook.png'),
                                          Image.asset(
                                              'assets/login/google.png'),
                                        ],
                                      ),
                                    ),
                                    kSizedBox,
                                    const Wrap(
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          'Don\'t have an account?',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w100),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          'Signup',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        kSizedBox,
                        kSizedBox,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
