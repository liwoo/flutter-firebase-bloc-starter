import 'package:flutter/material.dart';

class SimpleDialogItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const SimpleDialogItem(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}