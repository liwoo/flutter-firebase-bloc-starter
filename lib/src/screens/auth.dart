import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: AuthPage());
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerConfigs = [
      EmailProviderConfiguration(),
      GoogleProviderConfiguration(
          // CLIENT_ID For web builds, I think
          clientId: dotenv.env['GOOGLE_CLIENT_ID'] ?? ""),
    ];

    return SignInScreen(
      headerBuilder: (context, constraints, _) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SvgPicture.asset('assets/images/flutteri_icon.svg'),
        );
      },
      sideBuilder: (context, constraints) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(constraints.maxWidth / 4),
            child: SvgPicture.asset('assets/images/flutteri_icon.svg'),
          ),
        );
      },
      subtitleBuilder: (context, action) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            action == AuthAction.signIn
                ? 'Welcome to FlutterFire UI! Please sign in to continue.'
                : 'Welcome to FlutterFire UI! Please create an account to continue',
          ),
        );
      },
      footerBuilder: (context, action) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              action == AuthAction.signIn
                  ? 'By signing in, you agree to our terms and conditions.'
                  : 'By registering, you agree to our terms and conditions.',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
      providerConfigs: providerConfigs,
    );
  }
}
