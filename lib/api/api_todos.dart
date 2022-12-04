import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doing_doing_clone/model/model_todo.dart';
import 'package:doing_doing_clone/utils.dart';

class TodosApi {
  // Create
  static Future<String> createTodo(Todo todo) async {
    final todoDoc = FirebaseFirestore.instance.collection("todo").doc();

    todo.id = todoDoc.id;
    await todoDoc.set(todo.toJson());

    return todoDoc.id;
  }

  static Stream<List<Todo>> readTodos(DateTime date) {
    final DateTime start = DateTime(date.year, date.month, 1, 0 , 0, 0);
    final DateTime end = DateTime(date.year, date.month, 4, 23, 59, 59);

    return FirebaseFirestore.instance
      .collection('todo')
      .where(TodoField.date, isGreaterThanOrEqualTo: start, isLessThanOrEqualTo: end)
      .snapshots()
      .transform(Utils.transformer(Todo.fromJson));
    }

  static Future updateTodo(Todo todo) async {
    final todoDoc = FirebaseFirestore.instance.collection("todo").doc(todo.id);
    await todoDoc.update(todo.toJson());
  }

  static Future deleteTodo(Todo todo) async {
    final todoDoc = FirebaseFirestore.instance.collection("todo").doc(todo.id);
    await todoDoc.delete();
  }
}