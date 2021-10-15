import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/ultilities/ultils.dart';

class TodoDetailView extends StatelessWidget {
  const TodoDetailView({Key? key, required this.todo}) : super(key: key);
  final Datum todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Todo'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              todo.date,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w600, color: customBlue),
            ),
            Text(
              todo.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 15),
            Text(todo.description)
          ],
        ),
      ),
    );
  }
}
