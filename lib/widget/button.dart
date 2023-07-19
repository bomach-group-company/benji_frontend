import 'package:flutter/material.dart';

import '../utils/constant.dart';

class MyOutlinedButton extends StatefulWidget {
  final void Function()? nav;
  const MyOutlinedButton({super.key, this.nav});

  @override
  State<MyOutlinedButton> createState() => _MyOutlinedButtonState();
}

class _MyOutlinedButtonState extends State<MyOutlinedButton> {
  bool btnHover = false;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onHover: (value) {
        setState(() {
          btnHover = value;
        });
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        side: const BorderSide(color: kGreenColor),
        foregroundColor: btnHover ? Colors.white : kGreenColor,
        backgroundColor: btnHover ? kGreenColor : Colors.transparent,
      ),
      onPressed: () {
        widget.nav;
      },
      child: const Text(
        'View All',
        style: TextStyle(),
      ),
    );
  }
}
