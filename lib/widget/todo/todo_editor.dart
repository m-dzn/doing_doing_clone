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
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.white)
            ),
          ]
        ),
        const SizedBox(height: 16),
        ReorderableTodoList()
      ]
    );
  }
}
