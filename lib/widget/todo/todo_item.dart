import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  // final Todo todo;

  TodoItem({
    super.key,
    // required this.todo
  });

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // 컨테이너
        height: 32,
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: Colors.black, width: 1))),
              const SizedBox(width: 12),
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                      height: 26,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.black))),
                      child: const Text("할 일")))
            ]));
  }
}
