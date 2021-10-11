import 'dart:developer';

import 'package:firebase_bloc_starter/src/repositories/todos_repository/todos_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';

import 'src/app.dart';
import 'src/blocs/app/app_bloc_observer.dart';
import 'src/repositories/auth_repository/authentication_repository.dart';

void main() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authenticationRepository = AuthenticationRepository();
  final todosRepository = TodosRepository();
  await authenticationRepository.user.first;
  runApp(App(
    authenticationRepository: authenticationRepository,
    todosRepository: todosRepository,
  ));
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("Handle messages ");
}
