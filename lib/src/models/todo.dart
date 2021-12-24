import 'package:firebase_bloc_starter/src/entities/todo_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const Todo._();
  const factory Todo(String task,
      {@Default(false) bool complete,
      required String id,
      String? note}) = _Todo;

  static Todo fromEntity(TodoEntity entity) {
    return Todo(
      entity.task,
      id: entity.id,
      complete: entity.complete,
      note: entity.note,
    );
  }

  TodoEntity toEntity() {
    return TodoEntity(
      id: this.id,
      task: this.task,
      complete: this.complete,
      note: this.note,
    );
  }
}
