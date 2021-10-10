import 'package:equatable/equatable.dart';
import 'package:firebase_bloc_starter/src/entities/todo_entity.dart';
import 'package:uuid/uuid.dart';

class Todo extends Equatable {
  final bool complete;
  final String id;
  final String note;
  final String task;

  Todo(this.task, {this.complete = false, String? id, String? note})
      : this.note = note ?? '',
        this.id = id ?? Uuid().v4();

  @override
  List<Object?> get props => [complete, id, note, task];

  Todo copyWith({bool? complete, String? id, String? note, String? task}) {
    return Todo(
      task ?? this.task,
      complete: complete ?? this.complete,
      id: id ?? this.id,
      note: note ?? this.note,
    );
  }

  @override
  int get hashCode {
    return complete.hashCode ^ task.hashCode ^ note.hashCode ^ id.hashCode;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Todo &&
            runtimeType == other.runtimeType &&
            complete == other.complete &&
            task == other.task &&
            note == other.note &&
            id == other.id;
  }

  @override
  String toString() {
    return 'Todo{complete: $complete, task: $task, note: $note, id: $id}';
  }

  TodoEntity toEntity() {
    return TodoEntity(
      id: id,
      task: task,
      complete: complete,
      note: note,
    );
  }

  static Todo fromEntity(TodoEntity entity) {
    return Todo(
      entity.task,
      id: entity.id,
      complete: entity.complete,
      note: entity.note,
    );
  }
}
