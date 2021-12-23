import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NotificationHandlerCubit extends Cubit<RemoteMessage?> {
  NotificationHandlerCubit() : super(null);

  void handleNotification(RemoteMessage message) {
    // TODO: Save notification to database or something
    emit(message);
  }
}

class ReceivedNotification extends Equatable {
  final String title;
  final String body;

  ReceivedNotification(this.title, this.body);

  @override
  List<Object?> get props => [this.body, this.title];
}
