import 'package:firebase_bloc_starter/src/models/todo.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final ValueChanged<bool?> onCheckboxChanged;
  const TodoItem(
      {Key? key, required this.todo, required this.onCheckboxChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: ListTile(
          title: Text(todo.task),
          leading: Checkbox(
            value: todo.complete,
            onChanged: onCheckboxChanged,
          ),
        ),
      ),
    );
  }
}
