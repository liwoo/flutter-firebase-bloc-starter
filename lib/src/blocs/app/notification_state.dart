import 'package:equatable/equatable.dart';

class NotificationState extends Equatable {
  NotificationState();
  @override
  List<Object?> get props => [];
}

class NotificationStatusState extends NotificationState {
  final String? token;
  final bool toggled;

  NotificationStatusState(this.token, this.toggled);

  @override
  List<Object?> get props => [this.token, this.toggled];

  NotificationStatusState copyWith({bool? toggled, String? token}) {
    return NotificationStatusState(
        token ?? this.token, toggled ?? this.toggled);
  }

  static NotificationStatusState empty() {
    return NotificationStatusState("", true);
  }
}

class NotificationReceivedState extends NotificationState {
  final String title;
  final String body;

  NotificationReceivedState(this.title, this.body);

  @override
  List<Object?> get props => [this.body, this.title];
}
