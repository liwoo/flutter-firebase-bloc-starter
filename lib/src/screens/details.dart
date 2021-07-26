import 'package:firebase_bloc_starter/src/blocs/todos/todos_bloc.dart';
import 'package:firebase_bloc_starter/src/blocs/todos/todos_event.dart';
import 'package:firebase_bloc_starter/src/blocs/todos/todos_state.dart';
import 'package:firebase_bloc_starter/src/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsPage extends StatelessWidget {
  final String id;
  const DetailsPage({Key? key, required this.id}) : super(key: key);

  static MaterialPageRoute page({required String id}) => MaterialPageRoute(
        builder: (_) => DetailsPage(
          id: id,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
      final Todo? todo = (state as TodosLoadSuccess)
          .todos
          .firstWhere((element) => element.id == this.id, orElse: null);
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.todoDetails),
        ),
        body: todo == null
            ? Container()
            : Container(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    Row(children: [
                      Checkbox(
                          value: todo.complete,
                          onChanged: (complete) {
                            BlocProvider.of<TodosBloc>(context).add(
                              TodoUpdated(
                                todo.copyWith(complete: !todo.complete),
                              ),
                            );
                          }),
                      Expanded(
                        child: Text(
                          todo.task,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ]),
                    Text(todo.note),
                  ],
                ),
              ),
      );
    });
  }
}