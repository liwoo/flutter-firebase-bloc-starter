import 'package:firebase_bloc_starter/AppKeys.dart';
import 'package:firebase_bloc_starter/src/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef OnSaveCallback = Function(String task, String note);

class AddEditTodoPage extends StatefulWidget {
  final OnSaveCallback onSave;
  final bool isEditing;
  final Todo? todo;
  AddEditTodoPage(
      {Key? key, required this.onSave, required this.isEditing, this.todo})
      : super(key: key);

  static MaterialPageRoute page(
          {required OnSaveCallback onSave,
          required bool editing,
          Todo? todo}) =>
      MaterialPageRoute(
        builder: (_) => AddEditTodoPage(
          onSave: onSave,
          isEditing: editing,
          todo: todo,
        ),
      );

  @override
  _AddEditTodoPageState createState() => _AddEditTodoPageState();
}

class _AddEditTodoPageState extends State<AddEditTodoPage> {
  // Todo: Validate that the note Items are not null
  bool get isEditing => widget.isEditing;
  String? _task;
  String? _note;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    _task = isEditing ? widget.todo?.task : '';
    _note = isEditing ? widget.todo?.note : '';

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.createTask),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              key: AppKeys.TaskFieldKey,
              initialValue: isEditing ? widget.todo?.task : '',
              style: textTheme.headline5,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.taskHint,
              ),
              onChanged: (value) => _task = value,
              onSaved: (value) => _task = value,
            ),
            TextFormField(
              key: AppKeys.DetailFieldKey,
              initialValue: isEditing ? widget.todo?.note : '',
              maxLines: 10,
              style: textTheme.subtitle1,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.noteHint,
              ),
              onChanged: (value) => _note = value,
              onSaved: (value) => _note = value,
            ),
            ElevatedButton(
                key: AppKeys.SaveNoteButtonKey,
                onPressed: () {
                  widget.onSave(_task!, _note!);
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.save))
          ],
        ),
      ),
    );
  }
}
