import 'package:flutter/material.dart';

typedef Widget NavBuilder(BuildContext context);

class NavFragmentContainer extends StatelessWidget {
  final NavBuilder builder;
  const NavFragmentContainer({Key? key, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              return this.builder(context);
            });
      },
    );
  }
}
