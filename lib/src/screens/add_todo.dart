import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef OnSaveCallback = Function(String task, String note);

class AddTodoPage extends StatefulWidget {
  final OnSaveCallback onSave;
  const AddTodoPage({Key? key, required this.onSave}) : super(key: key);

  static MaterialPageRoute page({required OnSaveCallback onSave}) => MaterialPageRoute(
        builder: (_) => AddTodoPage(
          onSave: onSave,
        ),
      );

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  // Todo: Validate that the note Items are not null
  String? _task;
  String? _note;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
              style: textTheme.headline5,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.taskHint,
              ),
              onChanged: (value) => _task = value,
            ),
            TextFormField(
              style: textTheme.subtitle1,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.noteHint,
              ),
              onChanged: (value) => _note = value,
            ),
            ElevatedButton(onPressed: () {
              debugPrint(_task);
              debugPrint(_note);
              widget.onSave(_task!, _note!);
              Navigator.pop(context);
            }, child: Text("Save"))
          ],
        ),
      ),
    );
  }
}
