import 'package:flutter/cupertino.dart';
import 'big_text_widget.dart';

class ColumnButtonWidget extends StatelessWidget {
  final String text;
  final Function function;
  final Color? textColor;
  final double? width;
  final double? height;
  final Color color;
  const ColumnButtonWidget(
      {Key? key,
      required this.text,
      required this.function,
      this.textColor,
      this.width,
      this.height,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => function(),
        child: Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(8)),
            width: width,
            height: height,
            child: Center(
              child: BigText(
                text: text,
                size: 40,
                fontWidget: FontWeight.bold,
                color: textColor,
              ),
            )));
  }
}
