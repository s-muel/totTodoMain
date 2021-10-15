import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/ultilities/ultils.dart';
import 'package:todo_app/views/todo_detail.dart';

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Datum todo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return TodoDetailView(
            todo: todo,
          );
        }));
      },
      child: Card(
        // color: Colors.amberAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: ListTile(
              leading: Icon(
                todo.status ? Icons.check_circle : Icons.check_circle_outline,
                size: 30,
                color: dateColor(date: 'today'),
              ),
              title: Text(
                //'Plan trip to Scotland',
                todo.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20),
              ),
              subtitle: Text(
                todo.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.notifications,
                    color: dateColor(date: 'today'),
                  ),
                  Text(
                    todo.date,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: dateColor(date: 'today')),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
