import 'package:doing_doing_clone/api/api_todos.dart';
import 'package:doing_doing_clone/model/model_todo.dart';
import 'package:doing_doing_clone/provider/date_time_provider.dart';
import 'package:doing_doing_clone/screen/screen_diary.dart';
import 'package:doing_doing_clone/widget/empty_todos.dart';
import 'package:doing_doing_clone/widget/todo_editor/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:doing_doing_clone/widget/common/name_sticker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/model_diary.dart';

class DiaryItem extends StatefulWidget {
  Diary diary;

  DiaryItem({
    super.key,
    required this.diary
  });

  @override
  _DiaryItemState createState() => _DiaryItemState();
}

class _DiaryItemState extends State<DiaryItem> {
  late DateTimeProvider _dateTimeProvider;
  DateFormat dateFormat = DateFormat('MM월 dd일 (E)', 'ko');

  @override
  Widget build(BuildContext context) {
    _dateTimeProvider = Provider.of(context);

    return InkWell(
      onTap: () async {
        final changedDate = await Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              _dateTimeProvider.changeDateTime(widget.diary.dateTime);
              return DiaryScreen();
            }
        ));

        print(changedDate);

        if (changedDate != null) {
          _dateTimeProvider.changeDateTime(changedDate);
        }
      },
        child: Container(
            // 외부 여백
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: Container(
                // 테두리 박스
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.3)),
                padding: const EdgeInsets.all(24),
                child:
                    Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              // Header
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.black12, width: 2)),
                              child: Column(
                                  children: <Widget>[NameSticker(label: dateFormat.format(widget.diary.dateTime))])),
                          Container(
                              // Body
                              margin: const EdgeInsets.only(top: 64),
                              child: Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: StreamBuilder<List<Todo>>(
                                      stream: TodosApi.readTodos(widget.diary.dateTime),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          final todos = snapshot.data ?? List.empty();

                                          return Wrap(
                                            runSpacing: 8,
                                            children: todos.map((todo) => TodoItem(todo: todo)).toList()
                                          );
                                        } else {
                                          return const EmptyTodos();
                                        }
                                      }
                                  ),
                              )
                          )
                        ]
                    )
            )
        )
    );
  }
}
