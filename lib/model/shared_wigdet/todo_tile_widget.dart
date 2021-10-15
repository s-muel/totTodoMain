import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/ultilities/ultils.dart';

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({
    Key? key,
    required this.status,
    Datum? todo,
  }) : super(key: key);

  final bool status;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.amberAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: ListTile(
          leading: Icon(
            status ? Icons.check_circle : Icons.check_circle_outline,
            size: 30,
            color: dateColor(date: 'today'),
          ),
          title: Text(
            'Plan trip to Scotland',
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
          ),
          subtitle: Text('The family trip to Scotland '),
          trailing: TextButton.icon(
              onPressed: null,
              icon: Icon(
                Icons.notifications,
                color: dateColor(date: 'today'),
              ),
              label: Text(
                'Today',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: dateColor(date: 'today')),
              )),
        ),
      ),
    );
  }
}
