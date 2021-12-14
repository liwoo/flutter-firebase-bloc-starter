import 'package:firebase_bloc_starter/src/screens/settings/theme_switcher.dart';
import 'package:firebase_bloc_starter/src/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'notification_toggle.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ThemeSwitcher(),
            NotificationToggle(),
          ],
        ),
      ),
    );
  }
}
