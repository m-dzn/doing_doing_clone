import 'package:doing_doing_clone/model/model_todo.dart';
import 'package:doing_doing_clone/provider/todos.dart';
import 'package:doing_doing_clone/widget/todo_editor/reorderable_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReorderableTodoList extends StatefulWidget {
  const ReorderableTodoList({Key? key}) : super(key: key);

  @override
  State<ReorderableTodoList> createState() => _ReorderableTodoListState();
}

class _ReorderableTodoListState extends State<ReorderableTodoList> {
  late TodosProvider _todosProvider;

  @override
  Widget build(BuildContext context) {
    // 할 일 목록 조회
    _todosProvider = Provider.of(context);
    final todos = _todosProvider.todos;

    return Container(
      width: double.infinity,
      height: 400,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.white54,
        borderRadius: BorderRadius.circular(16)
      ),
      child: ReorderableListView(
        buildDefaultDragHandles: false,
        children: <Widget>[
          for (final todo in todos)
            ListTile(
              key: ValueKey(todo),
              title: ReorderableTodoItem(todo: todo),
              trailing: const Icon(Icons.dehaze),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
          });

          final Todo item = todos.removeAt(oldIndex); // 리스트에서 기존 위치 정보 제거
          todos.insert(newIndex, item);                 // 새 위치 정보 추가
        },
      )
    );
  }
}
