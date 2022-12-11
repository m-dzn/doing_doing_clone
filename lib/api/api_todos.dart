import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doing_doing_clone/model/model_diary.dart';
import 'package:doing_doing_clone/model/model_todo.dart';
import 'package:doing_doing_clone/utils.dart';
import 'package:intl/intl.dart';

class TodosApi {
  // Create
  static Future<String> createTodo(Todo todo) async {
    // 할 일 생성
    final todoDoc = FirebaseFirestore.instance.collection("todo").doc();
    todo.id = todoDoc.id;
    await todoDoc.set(todo.toJson());

    // 다이어리 체크 후 없으면 생성
    String dateString = DateFormat("yyyy-MM-dd").format(todo.date);
    final diaryDoc = await FirebaseFirestore.instance.collection("diary").doc(dateString).get();

    if (!diaryDoc.exists) {
      final newDiaryDoc = FirebaseFirestore.instance.collection("diary").doc(dateString);
      Diary diary = Diary(id: dateString, dateTime: DateTime(todo.date.year, todo.date.month, todo.date.day));
      await newDiaryDoc.set(diary.toJson());
    }

    return todoDoc.id;
  }

  static Stream<List<Todo>> readTodos(DateTime? date) {
    if (date == null) return const Stream.empty();

    final DateTime start = DateTime(date.year, date.month, date.day, 0 , 0, 0);
    final DateTime end = DateTime(date.year, date.month, date.day, 23, 59, 59);

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