import 'package:firebase_bloc_starter/src/blocs/app/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar mainAppBar(BuildContext context) {
  final user = context.select((AppBloc bloc) => bloc.state.user);
  return AppBar(
    title: Text(AppLocalizations.of(context)!.appName),
    actions: <Widget>[
      TextButton(
        child: Text(user.name ?? '', style: TextStyle(color: Colors.white)),
        onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
      ),
    ],
  );
}
