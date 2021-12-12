import 'package:flutter/material.dart';

class NotificationPopup extends StatelessWidget {
  final String title;
  final String body;
  const NotificationPopup({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Incoming notification",
                style: Theme.of(context).textTheme.headline6,
              ),
              Divider(),
              Text(title),
              Text(body),
            ],
          ),
        ),
      ),
    );
  }
}
