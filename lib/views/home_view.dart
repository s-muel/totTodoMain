import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/ultilities/ultils.dart';
import 'package:todo_app/model/shared_wigdet/todo_tile_widget.dart';
import 'package:todo_app/views/create_todo_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final TodoController _todoController = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 50,
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red,
            backgroundImage: AssetImage('assets/profile_img.jpg'),
          ),
        ),
        title: const Text('My Tasks'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<Todo?>(
          future: _todoController.getAllTodo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                snapshot.data == null) {
              return CircularProgressIndicator.adaptive();
            }
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data == null) {
              return Text('Something went wrong');
            }
            return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return TodoTileWidget(
                    todo: snapshot.data!.data[index],
                    status: false,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: snapshot.data!.data.length);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CreateTodoView();
          }));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: SafeArea(
        child: InkWell(
          onTap: () {
            showBarModalBottomSheet(
                context: context,
                builder: (context) {
                  return CompletedTodoList();
                });
          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: customBlue,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Completed',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w600, color: customBlue),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: customBlue,
                    )
                  ],
                ),
                Text(
                  '24',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: customBlue),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//,,,,,,,,,,,,,,,,,,,,,,,,,,,,,completed list in the bottom sheet
//,,,,,,,,,,,,,, stl use used to create a stateleses class
//,,,,,,,,,,,,,, then it returned List view separator  from todoTile widget
//,,,,,,,,,,,,,, in model todo_tile_widget
class CompletedTodoList extends StatelessWidget {
  const CompletedTodoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return TodoTileWidget(
            status: false, todo: null,

            // status: false,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: 10);
  }
}

//.......................................todo class
