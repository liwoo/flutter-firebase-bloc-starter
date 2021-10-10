import 'package:firebase_bloc_starter/src/blocs/app/theme_cubit.dart';
import 'package:firebase_bloc_starter/src/repositories/todos_repository/todos_repository.dart';
import 'package:firebase_bloc_starter/src/themes.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'blocs/todos/todos_bloc.dart';
import 'blocs/todos/todos_event.dart';
import 'routes.dart';
import 'blocs/app/app_bloc.dart';
import 'repositories/auth_repository/authentication_repository.dart';

const appName = "My Sample App";

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
    required TodosRepository todosRepository,
  })  : _authenticationRepository = authenticationRepository,
        _todosRepository = todosRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;
  final TodosRepository _todosRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
          BlocProvider(
              create: (_) => TodosBloc(todosRepository: _todosRepository)
                ..add(TodosLoaded())),
          BlocProvider(create: (_) => ThemeCubit(ThemeMode.system))
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: theme,
      title: appName,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.select((ThemeCubit cubit) => cubit.state),
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
