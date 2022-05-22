import 'package:todo_app/model/todo.dart';

abstract class TodoServices {
  Future<List<Todo>> getAllTodo();
  addNewTask(String title, String description);
  editTask(String title, String description, Todo todo);
}
