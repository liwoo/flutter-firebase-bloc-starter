import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class EventsRepository {
  late Mixpanel mixpanel;

  Future<void> initEvents() async {
    mixpanel = await Mixpanel.init("KEY",
        optOutTrackingDefault: false);
  }

  void track(String topic, Map<String, dynamic>? data) {
    if (data == null) {
      mixpanel.track(topic);
    } else {
      mixpanel.track(topic, properties: data);
    }
  }
}
