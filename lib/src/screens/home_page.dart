import 'package:firebase_bloc_starter/src/blocs/filtered_todos/filtered_todos_bloc.dart';
import 'package:firebase_bloc_starter/src/blocs/filtered_todos/filtered_todos_state.dart';
import 'package:firebase_bloc_starter/src/blocs/todos/todos_bloc.dart';
import 'package:firebase_bloc_starter/src/blocs/todos/todos_event.dart';
import 'package:firebase_bloc_starter/src/models/todo.dart';
import 'package:firebase_bloc_starter/src/widgets/loading_indicator.dart';
import 'package:firebase_bloc_starter/src/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FilteredTodosBloc, FilteredTodosState>(
          builder: (context, state) {
        if (state is FilteredTodosLoadInProgress) {
          return LoadingIndicator();
        } else if (state is FilteredTodosLoadSuccess) {
          final todos = state.filteredTodos;
          return ReorderableListView.builder(
              itemCount: todos.length,
              onReorder: (fromIndex, toIndex) {
                BlocProvider.of<TodosBloc>(context)
                    .add(TodosReorder(fromIndex, toIndex));
              },
              itemBuilder: (context, index) {
                var todo = todos[index];
                return ReorderableDragStartListener(
                  index: index,
                  key: Key("todo_ $index"),
                  child: TodoItem(
                    todo: todo,
                    onCheckboxChanged: (bool? value) {
                      BlocProvider.of<TodosBloc>(context).add(
                        TodoUpdated(todo.copyWith(complete: !todo.complete)),
                      );
                    },
                  ),
                );
              });
        } else {
          return Text("empty");
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(AddTodoPage.page(onSave: (String task, String note) {
            BlocProvider.of<TodosBloc>(context).add(
              TodoAdded(Todo(task, note: note)),
            );
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
