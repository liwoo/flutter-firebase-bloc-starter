import 'package:firebase_bloc_starter/src/models/todo.dart';

class TodosRepository {
  var todos = [Todo("First Sample"), Todo("Second Sample")];
  Future saveTodos(List<Todo> todos) {
    this.todos.addAll(todos);
    return Future.value();
  }

  Future<List<Todo>> loadTodos() async {
    return Future.value(todos);
  }
}
