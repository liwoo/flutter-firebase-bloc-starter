import 'package:firebase_bloc_starter/src/blocs/app/notification_cubit.dart';
import 'package:firebase_bloc_starter/src/blocs/app/notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationToggle extends StatelessWidget {
  const NotificationToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationStatusState>(
        builder: (context, state) {
      return Container(
        child: Row(
          children: [
            Switch(
              value: state.toggled,
              onChanged: (current) {
                context.read<NotificationCubit>().toggleNotification(current);
              },
            ),
            Text("Nofications")
          ],
        ),
      );
    });
  }
}
