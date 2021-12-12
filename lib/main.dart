import 'package:firebase_bloc_starter/src/repositories/event_repository/events_repository.dart';
import 'package:firebase_bloc_starter/src/repositories/todos_repository/todos_repository.dart';
import 'package:firebase_bloc_starter/src/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';

import 'src/app.dart';
import 'src/blocs/app/app_bloc_observer.dart';
import 'src/repositories/auth_repository/authentication_repository.dart';

late NotificationService notificationService;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  notificationService = new NotificationService();
  final eventsRepository = EventsRepository();
  await eventsRepository.initEvents();
  Bloc.observer = AppBlocObserver(repository: eventsRepository);
  await Firebase.initializeApp();

  notificationService.initNotifications();

  final authenticationRepository = AuthenticationRepository();
  final todosRepository = TodosRepository();
  await authenticationRepository.user.first;
  runApp(App(
    authenticationRepository: authenticationRepository,
    todosRepository: todosRepository,
  ));
}
