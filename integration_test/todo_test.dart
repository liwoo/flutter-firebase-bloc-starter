import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_bloc_starter/AppKeys.dart';
import 'package:firebase_bloc_starter/src/app.dart';
import 'package:firebase_bloc_starter/src/models/todo.dart';
import 'package:firebase_bloc_starter/src/repositories/auth_repository/authentication_repository.dart';
import 'package:firebase_bloc_starter/src/repositories/todos_repository/todos_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

var _sampleTodo = new Todo('sample todo', id: 'fake', complete: false);

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "Testing adding todo item",
    (WidgetTester tester) async {
      final titleText = 'How to intergrate.';
      final detailText = 'Just gotta do it';

      await tester.pumpWidget(createApp());
      await tester.tap(find.byKey(AppKeys.LoginButtonKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(AppKeys.GoogleButtonKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(AppKeys.TaskFieldKey), titleText);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(AppKeys.DetailFieldKey), detailText);
      await tester.tap(find.byKey(AppKeys.SaveNoteButtonKey));
      await tester.pumpAndSettle();
      expect(find.text(titleText), findsOneWidget);
    },
  );
  testWidgets("Testing checking off todo item", (WidgetTester tester) async {
    await tester.pumpWidget(createApp());
    await tester.tap(find.byKey(AppKeys.LoginButtonKey));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(AppKeys.GoogleButtonKey));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key("check_${_sampleTodo.id}")));
    await tester.pumpAndSettle();
  });
  testWidgets("Testing editing todo item", (WidgetTester tester) async {
    final titleText = 'Edit my life';
    final detailText = 'No problem bro';

    await tester.pumpWidget(createApp());
    await tester.tap(find.byKey(AppKeys.LoginButtonKey));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(AppKeys.GoogleButtonKey));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key(_sampleTodo.id)));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(AppKeys.TaskFieldKey), titleText);
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(AppKeys.DetailFieldKey), detailText);
    await tester.tap(find.byKey(AppKeys.SaveNoteButtonKey));
    await tester.pumpAndSettle();
    await tester.idle();
    await tester.pump();
    expect(find.text(_sampleTodo.task), findsOneWidget);
  });
}

Widget createApp() {
  var collection = FakeFirebaseFirestore().collection("todos");
  collection.add(_sampleTodo.toEntity().toDocument());
  final authenticationRepository = AuthenticationRepository(
    firebaseAuth: MockFirebaseAuth(),
  );
  final todosRepository = TodosRepository(todoCollection: collection);
  return App(
    authenticationRepository: authenticationRepository,
    todosRepository: todosRepository,
  );
}
