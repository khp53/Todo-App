import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/services/todo/todo_services.dart';

class TodoServicesParse implements TodoServices {
  late Todo _todo;
  @override
  addNewTask(String title, String description) async {
    _todo = Todo();
    _todo.set('title', title);
    _todo.set('description', description);
    var response = await _todo.save();
    return response;
  }

  @override
  editTask(String title, String description, Todo todos) async {
    QueryBuilder<Todo> query = QueryBuilder<Todo>(Todo());

    query.whereEqualTo('objectId', todos.objectId);

    Todo? todo = await query.first();

    if (todo != null) {
      todo.set('title', title);
      todo.set('description', description);
      var response = await todo.save();
      return response;
    }
  }

  @override
  Future<List<Todo>> getAllTodo() async {
    QueryBuilder<Todo> query = QueryBuilder<Todo>(Todo());
    query.orderByDescending('createdAt');
    List<Todo> todos = await query.find();
    return todos;
  }
}
