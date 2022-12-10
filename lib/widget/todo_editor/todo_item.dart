import 'package:doing_doing_clone/provider/todos.dart';
import 'package:flutter/material.dart';
import 'package:doing_doing_clone/model/model_todo.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem({
    super.key,
    required this.todo
  });

  late TodosProvider _todosProvider;

  @override
  Widget build(BuildContext context) {
    _todosProvider = Provider.of(context);

    return Container(
      // 컨테이너
        height: 32,
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  width: 18,
                  height: 18,
                  child: Checkbox(
                      value: todo.completed,
                      onChanged: (value) {
                        _todosProvider.toggleTodoState(todo);
                      })
              ),
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
                      child: Text(todo.text)))
            ]));
  }
}