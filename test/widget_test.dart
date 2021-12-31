// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_bloc_starter/src/blocs/todos/todos_bloc.dart';
import 'package:firebase_bloc_starter/src/blocs/todos/todos_event.dart';
import 'package:firebase_bloc_starter/src/blocs/todos/todos_state.dart';
import 'package:firebase_bloc_starter/src/models/todo.dart';
import 'package:firebase_bloc_starter/src/repositories/todos_repository/todos_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_bloc_starter/src/blocs/app/app_bloc.dart';
import 'package:firebase_bloc_starter/src/models/user.dart';

void main() {
  late AppBloc appBloc;
  late TodosBloc todosBloc;
  late User user;
  var _sampleTodo = new Todo('sample todo', id: 'fake', complete: false);

  setUpAll(() {
    registerFallbackValue<AppEvent>(FakeAppEvent());
    registerFallbackValue<AppState>(FakeAppState());
  });

  setUp(() {
    appBloc = MockAppBloc();
    user = MockUser();
    var collection = FakeFirebaseFirestore().collection("todos");
    collection.add(_sampleTodo.toEntity().toJson());
    todosBloc =
        TodosBloc(todosRepository: TodosRepository(todoCollection: collection));
    when(() => user.email).thenReturn('test@gmail.com');
    when(() => user.name).thenReturn('John Doe');
    when(() => appBloc.state).thenReturn(AppState.authenticated(user));
  });

  group("Todo bloc", () {
    blocTest<TodosBloc, TodosState>('load todos',
        build: () => todosBloc,
        act: (bloc) => bloc.add(TodosLoaded()),
        expect: () => [
              TodosLoadSuccess([_sampleTodo])
            ]);
    blocTest<TodosBloc, TodosState>('delete todos',
        build: () => todosBloc,
        act: (bloc) => bloc.add(TodoDeleted(_sampleTodo)),
        expect: () => []);
  });
}

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

class FakeAppEvent extends Fake implements AppEvent {}

class FakeAppState extends Fake implements AppState {}

class MockUser extends Mock implements User {}
