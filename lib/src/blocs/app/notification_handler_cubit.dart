import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_state.dart';

class NotificationHandlerCubit extends Cubit<NotificationState> {
  NotificationHandlerCubit() : super(new NotificationState());
}
