import 'package:doing_doing_clone/model/model_todo.dart';
import 'package:doing_doing_clone/provider/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReorderableTodoItem extends StatelessWidget {
  Todo todo;

  ReorderableTodoItem({super.key, required this.todo});

  late TodosProvider _todosProvider;

  @override
  Widget build(BuildContext context) {
    _todosProvider = Provider.of(context);

    return Container(
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.cancel_outlined, color: Colors.black,), onPressed: () {
            _todosProvider.removeTodo(todo);
          }),
          Expanded(child: Text(todo.text)),
        ]
      )
    );
  }
}
