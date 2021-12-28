import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                ? AppLocalizations.of(context)!.welcomeSignIn
                : AppLocalizations.of(context)!.welcomeSignUp,
          ),
        );
      },
      footerBuilder: (context, action) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              action == AuthAction.signIn
                  ? AppLocalizations.of(context)!.termsSignIn
                  : AppLocalizations.of(context)!.termsSignUp,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
      providerConfigs: providerConfigs,
    );
  }
}
