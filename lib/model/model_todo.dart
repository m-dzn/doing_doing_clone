class Todo {
  String text;
  bool? completed;

  Todo({
    required this.text,
    this.completed,
  });

  Todo.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        completed = json['completed'];
}