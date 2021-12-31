import 'dart:async';

import 'package:firebase_bloc_starter/main.dart';
import 'package:firebase_bloc_starter/src/blocs/app/notification_cubit.dart';
import 'package:firebase_bloc_starter/src/blocs/app/notification_handler_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'notification_popup.dart';

class Notifier extends HookWidget {
  final Widget child;
  late final Stream<String> _tokenStream;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Notifier({required this.child});

  @override
  Widget build(BuildContext context) {
    _handleOnMessage(RemoteMessage message) async {
      // TODO: Parse the notification data, as for now just using the notification info
      context.read<NotificationHandlerCubit>().handleNotification(message);
    }

    void setToken(String? value) {
      // TODO: Save FCM Token somewhere
      if (value != null) {
        context.read<NotificationCubit>().tokenChanged(value);
      }
    }

    useEffect(() {
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
    }, []);

    return BlocListener<NotificationHandlerCubit, RemoteMessage?>(
      listener: (context, state) {
        if (state != null) {
          showDialog(
            context: context,
            builder: (context) => NotificationPopup(
              title: state.notification?.title ?? "",
              body: state.notification?.body ?? "",
            ),
          );
        }
      },
      child: child,
    );
  }
}
