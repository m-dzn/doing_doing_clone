import 'package:doing_doing_clone/widget/todo/reorderable_todo.dart';
import 'package:flutter/material.dart';

class ReorderableTodoList extends StatefulWidget {
  const ReorderableTodoList({Key? key}) : super(key: key);

  @override
  State<ReorderableTodoList> createState() => _ReorderableTodoListState();
}

class _ReorderableTodoListState extends State<ReorderableTodoList> {
  List<String> _list = ["Apple", "Ball", "Cat", "Dog", "Elephant"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.white54,
        borderRadius: BorderRadius.circular(16)
      ),
      child: ReorderableListView(

        children: <Widget>[
          for (final item in _list)
            ListTile(
              key: ValueKey(item),
              title: ReorderableTodo(content: item),
              trailing: Icon(Icons.dehaze),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
          });

          final String item = _list.removeAt(oldIndex); // 리스트에서 기존 위치 정보 제거
          _list.insert(newIndex, item);                 // 새 위치 정보 추가
        },
      ),
    );
  }
}
