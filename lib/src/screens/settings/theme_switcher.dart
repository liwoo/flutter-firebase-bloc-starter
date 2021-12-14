import 'package:firebase_bloc_starter/src/blocs/app/theme_cubit.dart';
import 'package:firebase_bloc_starter/src/screens/settings/setting_item.dart';
import 'package:firebase_bloc_starter/src/widgets/dialog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
