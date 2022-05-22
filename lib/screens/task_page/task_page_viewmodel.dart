import 'package:todo_app/dependencies/dependency.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/viewmodel.dart';
import 'package:todo_app/services/todo/todo_services.dart';

class TaskPageViewmodel extends Viewmodel {
  static final TaskPageViewmodel _instance = TaskPageViewmodel._internal();
  factory TaskPageViewmodel() {
    return _instance;
  }

  TodoServices get _todoServices => dependency();

  TaskPageViewmodel._internal();

  bool _isLoading = false;
  List<Todo> _todos = [];

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    turnIdle();
  }

  List<Todo> get todos => _todos;
  set todos(List<Todo> value) {
    _todos = value;
    turnIdle();
  }

  // fetch all tasks from parse server
  Future<List<Todo>> getAllTasks() async {
    List<Todo> todos = await _todoServices.getAllTodo();
    return todos;
  }
}
