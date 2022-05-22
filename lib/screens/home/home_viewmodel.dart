import 'package:todo_app/screens/viewmodel.dart';

class HomeViewmodel extends Viewmodel {
  static final HomeViewmodel _instance = HomeViewmodel._internal();
  factory HomeViewmodel() {
    return _instance;
  }

  HomeViewmodel._internal();

  bool _isLoading = false;
  bool _isCompleted = false;
  int _selectedIndex = 0;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    turnIdle();
  }

  bool get isCompleted => _isCompleted;
  set isCompleted(bool value) {
    _isCompleted = value;
    turnIdle();
  }

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    turnIdle();
  }

  // TextEditingController? _titleController;
  // TextEditingController? _descriptionController;

  // TextEditingController? get titleController => _titleController;

  // set titleController(TextEditingController? value) {
  //   _titleController = value;
  //   turnIdle();
  // }

  // TextEditingController? get descriptionController => _descriptionController;

  // set descriptionController(TextEditingController? value) {
  //   _descriptionController = value;
  //   turnIdle();
  // }
}
