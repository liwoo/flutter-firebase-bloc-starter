import 'package:firebase_bloc_starter/src/blocs/home/bottom_nav_cubit.dart';
import 'package:firebase_bloc_starter/src/screens/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/app/app_bloc.dart';
import 'home_page.dart';
import 'notification.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomeScreen());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BottomNavCubit(), child: HomeScreenContainer());
  }
}

class HomeScreenContainer extends StatelessWidget {
  final _pageNavigation = [
    HomePage(),
    NotificationsPage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return BlocBuilder<BottomNavCubit, int>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appName),
          actions: <Widget>[
            TextButton(
              child:
                  Text(user.name ?? '', style: TextStyle(color: Colors.white)),
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
            ),
          ],
        ),
        body: _pageNavigation[state],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: state,
          onTap: (int index) =>
              context.read<BottomNavCubit>().updateIndex(index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: AppLocalizations.of(context)!.home),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: AppLocalizations.of(context)!.notifications),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings)
          ],
        ),
      );
    });
  }
}
