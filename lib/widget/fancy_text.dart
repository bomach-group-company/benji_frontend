import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFancyText extends StatelessWidget {
  final String text;
  const MyFancyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Text(
      text,
      style: GoogleFonts.oleoScript(
        color: const Color(0xff2d2942),
        fontSize: media.width * 0.035 + 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
