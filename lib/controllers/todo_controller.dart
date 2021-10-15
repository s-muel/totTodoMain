// import 'package:http/http.dart';
import 'package:http/http.dart';
import 'package:todo_app/services/todo_service.dart';
import 'dart:convert';
import 'package:todo_app/models/todo.dart';

class TodoController {
  final TodoService _todoService = TodoService();

  Future<Todo?> getAllTodo() async {
    Todo? _todo;
    await _todoService.getAllTodoRequest().then((response) {
      int statusCode = response.statusCode;
      //print(response.body);
      if (statusCode == 200) {
        //sucess
        _todo = Todo.fromMap(json.decode(response.body));
      } else {
        print('error');
        _todo = null;
      }
    }).catchError((onError) {
      print(onError);
      // print(StackTrace.current);
      _todo = null;
    });
    return _todo;
  }

  Future<bool> createTodo({
    required String title,
    required String description,
    required String dateTime,
    // required bool status
  }) async {
    bool isSuccessful = false;
    await _todoService
        .createToDoRequest(
      title: title,
      description: description,
      dateTime: dateTime,
      //  status: status
    )
        .then((response) {
      int statusCode = response.statusCode;
      if (statusCode == 201) {
        //sucess
        isSuccessful = true;
      } else {
        isSuccessful = false;
      }
    }).catchError((onError) {
      isSuccessful = false;
    });
    return isSuccessful;
  }
}
