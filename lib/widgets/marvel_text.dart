import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarvelTextWidget extends StatelessWidget {
  const MarvelTextWidget(this.size, this.text, {super.key});

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.dmSans(
        textStyle: TextStyle(
          fontSize: size,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
