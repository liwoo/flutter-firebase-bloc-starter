import 'package:flutter/widgets.dart';

import 'package:firebase_bloc_starter/src/screens/welcome.dart';
import 'screens/home.dart';
import 'blocs/app/app_bloc.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
    default:
      return [WelcomePage.page()];
  }
}
