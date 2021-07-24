import 'package:equatable/equatable.dart';
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
}
