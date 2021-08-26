import 'package:firebase_bloc_starter/src/widgets/appbar.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      body: Container(
        child: Center(
          child: Text("Notifications"),
        ),
      ),
    );
  }
}
