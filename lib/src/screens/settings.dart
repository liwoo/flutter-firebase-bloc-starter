import 'package:firebase_bloc_starter/src/blocs/app/theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ThemeSwitcher(),
        ],
      ),
    );
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
        child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  Icons.wb_sunny,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Change theme"),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      themeName(context.read<ThemeCubit>().state),
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                )
              ],
            )),
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