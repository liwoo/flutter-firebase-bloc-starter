import 'package:firebase_bloc_starter/src/blocs/register/register_cubic.dart';
import 'package:firebase_bloc_starter/src/repositories/auth_repository/authentication_repository.dart';
import 'package:firebase_bloc_starter/src/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterDialog extends StatelessWidget {
  const RegisterDialog({Key? key}) : super(key: key);

  static Dialog dialog() => const Dialog(child: RegisterDialog());

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: BlocProvider(
          create: (_) => RegisterCubit(context.read<AuthenticationRepository>()),
          child: const RegisterForm(),
        ));
  }
}
