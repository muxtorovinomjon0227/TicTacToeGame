import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight? fontWidget;
  const BigText(
      {Key? key,
      required this.text,
      this.size = 20,
      this.color,
      this.fontWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sacramento(
        textStyle: Theme.of(context).textTheme.bodyMedium,
        fontSize: size,
        fontWeight: fontWidget,
        fontStyle: FontStyle.normal,
        color: color,
      ),
    );
  }
}
