import 'package:equatable/equatable.dart';
import 'package:firebase_bloc_starter/src/models/todo.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodosLoaded extends TodosEvent {}

class TodoAdded extends TodosEvent {
  final Todo todo;

  const TodoAdded(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoAdded { todo: $todo }';
}

class TodoUpdated extends TodosEvent {
  final Todo todo;

  const TodoUpdated(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoUpdated { todo: $todo }';
}

class TodoDeleted extends TodosEvent {
  final Todo todo;

  const TodoDeleted(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoDeleted { todo: $todo }';
}

class TodosReorder extends TodosEvent {
  final int from;
  final int to;
  const TodosReorder(this.from, this.to);

  @override
  List<Object> get props => [from, to];

  @override
  String toString() => 'TodosReorder { from: $from, to: $to }';
}

class ClearCompleted extends TodosEvent {}

class ToggleAll extends TodosEvent {}

class TodosUpdated extends TodosEvent {
  final List<Todo> todos;

  const TodosUpdated(this.todos);

  @override
  List<Object> get props => [todos];
}