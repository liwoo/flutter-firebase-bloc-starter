import 'package:firebase_bloc_starter/src/blocs/app/notification_cubit.dart';
import 'package:firebase_bloc_starter/src/blocs/app/notification_state.dart';
import 'package:firebase_bloc_starter/src/blocs/app/theme_cubit.dart';
import 'package:firebase_bloc_starter/src/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

class NotificationToggle extends StatelessWidget {
  const NotificationToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
      return Container(
        child: Row(
          children: [
            Switch(
                value: state.toggled,
                onChanged: (current) {
                  context.read<NotificationCubit>().toggleNotification(current);
                })
          ],
        ),
      );
    });
  }
}

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String themeName(ThemeMode themeMode) {
      switch (themeMode) {
        case ThemeMode.light:
          return AppLocalizations.of(context)!.light;
        case ThemeMode.dark:
          return AppLocalizations.of(context)!.dark;
        default:
          return AppLocalizations.of(context)!.system;
      }
    }

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) => InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  title: Text("Choose theme"),
                  children: [
                    SimpleDialogItem(
                      text: AppLocalizations.of(context)!.system,
                      onPressed: () {
                        context
                            .read<ThemeCubit>()
                            .changeTheme(ThemeMode.system);
                        Navigator.of(context).pop();
                      },
                    ),
                    SimpleDialogItem(
                      text: AppLocalizations.of(context)!.light,
                      onPressed: () {
                        context.read<ThemeCubit>().changeTheme(ThemeMode.light);
                        Navigator.of(context).pop();
                      },
                    ),
                    SimpleDialogItem(
                      text: AppLocalizations.of(context)!.dark,
                      onPressed: () {
                        context.read<ThemeCubit>().changeTheme(ThemeMode.dark);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        },
        child: SettingItem(
          iconData: Icons.wb_sunny,
          text: "Change theme",
          current: themeName(context.read<ThemeCubit>().state),
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  final String current;

  const SettingItem(
      {Key? key,
      required this.iconData,
      required this.current,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              SizedBox(
                height: 12,
              ),
              Text(
                current,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          )
        ],
      ),
    );
  }
}

class SimpleDialogItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const SimpleDialogItem(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
