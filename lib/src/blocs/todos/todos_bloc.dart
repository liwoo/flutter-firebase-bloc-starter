import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_bloc_starter/src/blocs/todos/todos_event.dart';
import 'package:firebase_bloc_starter/src/blocs/todos/todos_state.dart';
import 'package:firebase_bloc_starter/src/models/todo.dart';
import 'package:firebase_bloc_starter/src/repositories/todos_repository/todos_repository.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosRepository todosRepository;
  StreamSubscription? _todosSubscription;

  TodosBloc({required this.todosRepository}) : super(TodosLoadInProgress());

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is TodosLoaded) {
      yield* _mapTodosLoadedToState();
    } else if (event is TodoAdded) {
      yield* _mapTodoAddedToState(event);
    } else if (event is TodoUpdated) {
      yield* _mapTodoUpdatedToState(event);
    } else if (event is TodoDeleted) {
      yield* _mapTodoDeletedToState(event);
    } else if (event is ToggleAll) {
      yield* _mapToggleAllToState();
    } else if (event is ClearCompleted) {
      yield* _mapClearCompletedToState();
    } else if (event is TodosReorder) {
      yield* _mapToReorder(event);
    } else if (event is TodosUpdated) {
      yield* _mapTodosUpdateToState(event);
    }
  }

  Stream<TodosState> _mapTodosLoadedToState() async* {
    _todosSubscription?.cancel();
    _todosSubscription = todosRepository.todos().listen(
          (todos) => add(TodosUpdated(todos)),
        );
  }

  Stream<TodosState> _mapTodoAddedToState(TodoAdded event) async* {
    todosRepository.addNewTodo(event.todo);
  }

  Stream<TodosState> _mapTodoUpdatedToState(TodoUpdated event) async* {
    todosRepository.updateTodo(event.todo);
  }

  Stream<TodosState> _mapTodoDeletedToState(TodoDeleted event) async* {
    todosRepository.deleteTodo(event.todo);
  }

  Stream<TodosState> _mapToggleAllToState() async* {
    if (state is TodosLoadSuccess) {
      final allComplete =
          (state as TodosLoadSuccess).todos.every((todo) => todo.complete);
      final List<Todo> updatedTodos = (state as TodosLoadSuccess)
          .todos
          .map((Todo todo) => todo.copyWith(complete: !allComplete))
          .toList();
      updatedTodos.forEach((updatedTodo) {
        todosRepository.updateTodo(updatedTodo);
      });
    }
  }

  Stream<TodosState> _mapClearCompletedToState() async* {
    if (state is TodosLoadSuccess) {
      final List<Todo> updatedTodos = (state as TodosLoadSuccess)
          .todos
          .where((todo) => !todo.complete)
          .toList();
      updatedTodos.forEach((completedTodo) {
        todosRepository.deleteTodo(completedTodo);
      });
    }
  }

  Stream<TodosState> _mapToReorder(TodosReorder event) async* {
    if (state is TodosLoadSuccess) {
      int oldIndex = event.from;
      int newIndex = event.to;

      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final List<Todo> updatedTodos =
          (state as TodosLoadSuccess).todos.toList();
      final Todo item = updatedTodos.removeAt(oldIndex);
      updatedTodos.insert(newIndex, item);

      yield TodosLoadSuccess(updatedTodos);
    }
  }

  Stream<TodosState> _mapTodosUpdateToState(TodosUpdated event) async* {
    yield TodosLoadSuccess(event.todos);
  }

  @override
  Future<void> close() {
    _todosSubscription?.cancel();
    return super.close();
  }
}
