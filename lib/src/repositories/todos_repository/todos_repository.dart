import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_bloc_starter/src/entities/todo_entity.dart';
import 'package:firebase_bloc_starter/src/models/todo.dart';

class TodosRepository {
  final CollectionReference<Map<String, dynamic>> _todoCollection;
  TodosRepository({CollectionReference<Map<String, dynamic>>? todoCollection})
      : _todoCollection =
            todoCollection ?? FirebaseFirestore.instance.collection('todos');
  Future<void> addNewTodo(Todo todo) {
    return _todoCollection.doc(todo.id).set((todo.toEntity().toDocument()));
  }

  Future<void> deleteTodo(Todo todo) async {
    return _todoCollection.doc(todo.id).delete();
  }

  Stream<List<Todo>> todos() {
    return _todoCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Todo.fromEntity(TodoEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  Future<void> updateTodo(Todo todo) {
    return _todoCollection.doc(todo.id).update(todo.toEntity().toDocument());
  }
}
