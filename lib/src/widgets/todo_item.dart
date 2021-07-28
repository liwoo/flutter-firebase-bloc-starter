import 'package:firebase_bloc_starter/src/models/todo.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final ValueChanged<bool?> onCheckboxChanged;
  final GestureTapCallback onTap;

  const TodoItem(
      {Key? key,
      required this.todo,
      required this.onCheckboxChanged,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          key: Key(todo.id),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(8),
            child: ListTile(
              title: Text(todo.task),
              leading: Checkbox(
                key: Key("check_${todo.id}"),
                value: todo.complete,
                onChanged: onCheckboxChanged,
              ),
            ),
          )),
    );
  }
}
