import 'package:flutter/cupertino.dart';

import '../big_text_widget.dart';

class ColumnButtonWidget extends StatelessWidget {
  final String text;
  final Widget icon;
  final Function function;
  final Color? textColor;
  const ColumnButtonWidget(
      {Key? key,
      required this.text,
      required this.icon,
      required this.function, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Column(
        children: [
          icon,
          BigText(
            text: text,
            size: 16,
            color: textColor,
          )
        ],
      ),
    );
  }
}
