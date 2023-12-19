import 'package:flutter/material.dart';

import '../big_text_widget.dart';

class CardButtonWidget extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function function;
  final double? height;
  final double? width;
  final Color cardColor;
  const CardButtonWidget(
      {Key? key,
      required this.text,
      required this.icon,
      required this.function,
      this.height = 110,
      this.width = 110,
        this.cardColor = Colors.white
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes x,y position of shadow
          ),
        ],
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon, const SizedBox(height: 20), BigText(text: text)],
      ),
    );
  }
}
