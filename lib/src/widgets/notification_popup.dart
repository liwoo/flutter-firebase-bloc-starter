import 'package:flutter/material.dart';

class NotificationPopup extends StatelessWidget {
  final String title;
  final String body;
  const NotificationPopup({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Incoming notification"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          Text(body),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
