import 'package:doing_doing_clone/utils.dart';

class TodoField {
  static const id = 'id';
  static const text = 'text';
  static const completed = 'completed';
  static const date = 'date';
}

class Todo {
  String? id;
  String text;
  bool completed;
  final DateTime date;

  Todo({
    this.id,
    required this.text,
    this.completed = false,
    DateTime? date
  }) : date = date ?? DateTime.now();

  // JSON을 객체로 deserialize합니다. (FireStore 조회 시 사용)
  static Todo fromJson(Map<String, dynamic> json) => Todo(
      id: json[TodoField.id],
      text: json[TodoField.text],
      completed: json[TodoField.completed],
      date: Utils.toDateTime(json[TodoField.date])
  );

  // 객체를 JSON으로 serialize합니다. (FireStore 저장 시 사용)
  Map<String, dynamic> toJson() => {
    TodoField.id: id,
    TodoField.text: text,
    TodoField.completed: completed,
    TodoField.date: Utils.fromDateTimeToJson(date)
  };
}
