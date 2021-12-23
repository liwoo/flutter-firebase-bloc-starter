import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState.empty());

  void toggleNotification(bool toggle) {
    var newState = toggle
        ? new NotificationOnState(state.token)
        : new NotificationOffState(state.token);
    emit(newState);
    _sendPush(newState);
  }

  void tokenChanged(String token) {
    emit(state.copyWith(token: token));
  }

  Future<void> _sendPush(NotificationState state) async {
    if (state.token == null) {
      return null;
    }
    try {
      var req = await http.post(
        Uri.parse(dotenv.env['FCM_WEB_LINK'] ?? ""),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "key=${dotenv.env['F_SERVER_KEY'] ?? ""}"
        },
        body: _constructFCMPayload(state),
      );
      print(req.body);
    } catch (e) {
      print(e);
    }
  }

  String _constructFCMPayload(NotificationState state) {
    return jsonEncode({
      "to": state.token,
      "notification": {
        "title":
            "Notification ${(state is NotificationOnState ? "On" : "Off")}",
        "body": "This is the notification and all that.",
        "click_action": "NOTIFICATION_CLICK"
      },
      "data": {"sample": "data"}
    });
  }
}
