import 'package:firebase_bloc_starter/src/blocs/home/bottom_nav_cubit.dart';
import 'package:firebase_bloc_starter/src/screens/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(builder: (context, state) {
      return Scaffold(
        body: IndexedStack(
          index: state,
          children: [
            HomePage(),
            NotificationsPage(),
            SettingsPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
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
