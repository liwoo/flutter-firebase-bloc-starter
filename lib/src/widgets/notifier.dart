import 'dart:async';

import 'package:firebase_bloc_starter/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifier extends StatefulWidget {
  final Widget child;
  const Notifier({Key? key, required this.child}) : super(key: key);

  @override
  _NotifierState createState() => _NotifierState();
}

class _NotifierState extends State<Notifier> {
  late Stream<String> _tokenStream;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();

    _fcm.getToken().then(setToken);
    _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    _tokenStream.listen(setToken);

    // Message received while in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          channel.id,
          channel.name,
          channel.description,
          icon: 'launch_background',
        );
        NotificationDetails platformChannelSpecifics =
            NotificationDetails(android: androidPlatformChannelSpecifics);
        flutterLocalNotificationsPlugin.show(notification.hashCode,
            notification.title, notification.body, platformChannelSpecifics);
        _handleOnMessage(message);
      }
    });

    // User notification click event from a background state (not terminated).
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });

    // If the app has be opened terminated state using notification
    _fcm.getInitialMessage().then((RemoteMessage? message) => {
          if (message != null)
            {
              // Todo: Do something with the initial message from wake
              _handleOnMessage(message)
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  _handleOnMessage(RemoteMessage message) async {}

  void setToken(String? value) {}
}
