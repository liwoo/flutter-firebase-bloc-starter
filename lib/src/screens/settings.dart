import 'package:firebase_bloc_starter/src/blocs/app/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(builder: (context,state) => SettingsContainer());
  }
}

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Change theme"),
              Switch(
                onChanged: (bool value) {
                  context.read<ThemeCubit>().toggleTheme();
                },
                value: context.read<ThemeCubit>().state,
              )
            ],
          )
        ],
      ),
    );
  }
}

