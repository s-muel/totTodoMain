import 'package:http/http.dart';

//consume a get API in flutter
class TodoService {
  Future<Response> getAllTodoRequest() async {
    //flutter is using URI's for strings
    return await get(Uri.parse("https://lion-digitized.cyclic-app.com/todo"));
  }

  Future<Response> getTodoByIdRequest(String id) async {
    return await get(
        Uri.parse("https://lion-digitized.cyclic-app.com/todo/$id"));
  }

  createToDoRequest({
    required String title,
    required String description,
    required String dateTime,
    //required bool status
  }) async {
    Map<String, String> body = {
      "title": title,
      "description": description,
      "date_time": dateTime
    };
    Map<String, String> header = {'Content-Type': 'application/json'};

    return post(Uri.parse("https://lion-digitized.cyclic-app.com/todo"),
        body: body);
  }

  //update status of todo
  Future<Response> updateToDoRequest(
      {required bool status, required String id}) async {
    Map<String, bool> body = {
      "status": status,
    };
    return await patch(
        Uri.parse("https://lion-digitized.cyclic-app.com/todo/$id"),
        body: body);
  }

  Future<Response> deleteToDoRequest(String id) async {
    return await delete(
        Uri.parse("https://lion-digitized.cyclic-app.com/todo/$id"));
  }
}
