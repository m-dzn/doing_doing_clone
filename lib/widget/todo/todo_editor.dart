import 'package:doing_doing_clone/model/model_todo.dart';
import 'package:doing_doing_clone/service/fire_service.dart';
import 'package:flutter/material.dart';
import 'package:doing_doing_clone/widget/common/dd_text_field.dart';
import 'package:doing_doing_clone/widget/todo/reorderable_todo_list.dart';

import '../common/name_sticker.dart';

class TodoEditor extends StatefulWidget {
  const TodoEditor({Key? key}) : super(key: key);

  @override
  State<TodoEditor> createState() => _TodoEditorState();
}

class _TodoEditorState extends State<TodoEditor> {
  @override
  Widget build(BuildContext context) {
    return
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NameSticker(label: '할 일'),
        Row(
          children: [
            Expanded(child: DDTextField(hintText: "할 일을 추가해주세요",)),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () async {
                print('todo editor');
                Todo _todo = Todo(text: "테스트 투두", completed: false);
                await FireService().createTodo(_todo.toJson());
              }
            ),
          ]
        ),
        const SizedBox(height: 16),
        ReorderableTodoList()
      ]
    );
  }
}
