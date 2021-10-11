import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    // Todo: Handle notication permission on IOS and web

    _fcm.getToken().then(setToken);
    _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    _tokenStream.listen(setToken);

    // Message received while in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null && !kIsWeb) {
        //
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

  _handleOnMessage(RemoteMessage message) {}

  void setToken(String? value) {}
}
