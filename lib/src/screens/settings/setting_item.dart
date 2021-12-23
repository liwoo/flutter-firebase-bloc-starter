import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  final String current;

  const SettingItem(
      {Key? key,
      required this.iconData,
      required this.current,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Theme.of(context).colorScheme.secondary,
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              SizedBox(
                height: 12,
              ),
              Text(
                current,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          )
        ],
      ),
    );
  }
}
