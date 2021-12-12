import 'dart:async';

import 'package:firebase_bloc_starter/main.dart';
import 'package:firebase_bloc_starter/src/blocs/app/notification_cubit.dart';
import 'package:firebase_bloc_starter/src/blocs/app/notification_handler_cubit.dart';
import 'package:firebase_bloc_starter/src/blocs/app/notification_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_popup.dart';

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
        notificationService.showNotification(notification);
        _handleOnMessage(message);
      }
    });

    // User notification click event from a background state (not terminated).
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      _handleOnMessage(message);
    });

    // If the app has be opened terminated state using notification
    _fcm.getInitialMessage().then((RemoteMessage? message) => {
          if (message != null)
            {
              // TODO: Do something with the initial message from wake
              _handleOnMessage(message)
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationHandlerCubit, NotificationState>(
        builder: (context, state) {
      return Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          widget.child,
          if (state is NotificationReceivedState)
            NotificationPopup(
              title: state.title,
              body: state.body,
            ),
        ],
      );
    });
  }

  _handleOnMessage(RemoteMessage message) async {
    // TODO: Parse the notification data, as for now just using the notification info
    context.read<NotificationHandlerCubit>().emit(new NotificationReceivedState(
        message.notification?.title ?? "", message.notification?.body ?? ""));
  }

  void setToken(String? value) {
    // TODO: Save FCM Token somewhere
    if (value != null) {
      context.read<NotificationCubit>().tokenChanged(value);
    }
  }
}
