import 'package:equatable/equatable.dart';

class NotificationState extends Equatable {
  final String? token;

  NotificationState(this.token);

  @override
  List<Object?> get props => [this.token];

  NotificationState copyWith({String? token}) {
    return NotificationState(token ?? this.token);
  }

  static NotificationState empty() {
    return NotificationState("");
  }
}

class NotificationOnState extends NotificationState {
  NotificationOnState(String? token) : super(token);
}

class NotificationOffState extends NotificationState {
  NotificationOffState(String? token) : super(token);
}
