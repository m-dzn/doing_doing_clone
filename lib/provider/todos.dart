import 'package:doing_doing_clone/api/api_todos.dart';
import 'package:doing_doing_clone/model/model_todo.dart';
import 'package:flutter/cupertino.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  /* 기본 데이터 세팅 */
  void setTodos(List<Todo>? todos) => todos != null ?
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _todos = todos;
        notifyListeners();
      }) : [];

  /* 기본 CRUD 로직 */
  /** Firebase에 할 일을 등록합니다. */
  void addTodo(Todo todo) => TodosApi.createTodo(todo);

  void updateTodo(Todo todo, String text) {
    todo.text = text;
    TodosApi.updateTodo(todo);
  }

  void removeTodo(Todo todo) => TodosApi.deleteTodo(todo);

  /* 기타 Business Logic */
  bool toggleTodoState(Todo todo) {
    todo.completed = !todo.completed;
    TodosApi.updateTodo(todo);
    return todo.completed;
  }
}