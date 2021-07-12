// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_bloc_starter/src/blocs/app/app_bloc.dart';
import 'package:firebase_bloc_starter/src/models/user.dart';
import 'package:firebase_bloc_starter/src/screens/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  late AppBloc appBloc;
  late User user;

  setUpAll(() {
    registerFallbackValue<AppEvent>(FakeAppEvent());
    registerFallbackValue<AppState>(FakeAppState());
  });

  setUp(() {
    appBloc = MockAppBloc();
    user = MockUser();
    when(() => user.email).thenReturn('test@gmail.com');
    when(() => user.name).thenReturn('John Doe');
    when(() => appBloc.state).thenReturn(AppState.authenticated(user));
  });
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    const appName = "My Sample App";

    await tester.pumpWidget(
      BlocProvider.value(
        value: appBloc,
        child: const MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: HomeScreen()),
      ),
    );
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Welcome to $appName'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

class FakeAppEvent extends Fake implements AppEvent {}

class FakeAppState extends Fake implements AppState {}

class MockUser extends Mock implements User {}
