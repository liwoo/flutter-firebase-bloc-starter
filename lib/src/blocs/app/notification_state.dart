import 'package:equatable/equatable.dart';

class NotificationState extends Equatable {
  final String? token;
  final bool toggled;

  NotificationState(this.token, this.toggled);

  @override
  List<Object?> get props => [this.token, this.toggled];

  NotificationState copyWith({bool? toggled, String? token}) {
    return NotificationState(token ?? this.token, toggled ?? this.toggled);
  }

  static NotificationState empty() {
    return NotificationState("", true);
  }
}
