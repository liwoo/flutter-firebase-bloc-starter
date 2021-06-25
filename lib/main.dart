
import 'package:flutter/material.dart';

const appName = "My Sample App";

void main() {
  print('Welcome to $appName');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      title: appName,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Center(
        child: Text('Welcome to $appName'),
      ),
    );
  }
}

