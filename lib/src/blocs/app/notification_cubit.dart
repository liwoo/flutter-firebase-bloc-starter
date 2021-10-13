import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(NotificationState state) : super(state);

  void toggleNotification(bool toggle) {
    var newState = state.copyWith(toggled: toggle);
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
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key={Server_Key}'
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
      "Message": {
        'to': state.token,
        'data': {'via': 'FlutterFire Cloud Messaging!!!', 'count': ""},
        'notification': {
          'title': 'Flutter Bloc starter',
          'body': 'You have ',
        },
      }
    });
  }
}
