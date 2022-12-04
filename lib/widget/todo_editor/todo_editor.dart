import 'package:doing_doing_clone/model/model_todo.dart';
import 'package:doing_doing_clone/api/api_todos.dart';
import 'package:doing_doing_clone/provider/todos.dart';
import 'package:doing_doing_clone/widget/common/dd_text_field.dart';
import 'package:doing_doing_clone/widget/todo_editor/reorderable_todo_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/name_sticker.dart';

class TodoEditor extends StatefulWidget {
  const TodoEditor({Key? key}) : super(key: key);

  @override
  State<TodoEditor> createState() => _TodoEditorState();
}

class _TodoEditorState extends State<TodoEditor> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const NameSticker(label: '할 일'),
      Row(children: [
        Expanded(
            child: DDTextField(
          controller: _textController,
          hintText: "할 일을 추가해주세요",
        )),
        IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () async {
              Todo newTodo = Todo(text: _textController.text);
              await TodosApi.createTodo(newTodo);
              _textController.clear();
            }),
      ]),
      const SizedBox(height: 16),

      /* 드래그 정렬 가능한 할 일 목록 위젯 */
      StreamBuilder<List<Todo>>(
          stream: TodosApi.readTodos(DateTime.now()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return const Center(
                      child: Text('Something Went Wrong Try later',
                          style: TextStyle(fontSize: 24, color: Colors.white)));
                } else {
                  final todos = snapshot.data;
                  final provider = Provider.of<TodosProvider>(context);
                  provider.setTodos(todos);

                  return const ReorderableTodoList();
                }
            }
          })
    ]);
  }
}
