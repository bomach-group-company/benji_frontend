import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(''))),
    );
  }
}
