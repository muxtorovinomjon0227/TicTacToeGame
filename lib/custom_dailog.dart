import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final void Function() onPressed;
  final String actionText;

  const CustomDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.onPressed,
      required this.actionText});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        ElevatedButton(
          onPressed: onPressed,
          child: Text(actionText),
        )
      ],
    );
  }
}
