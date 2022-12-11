import 'package:doing_doing_clone/api/api_diaries.dart';
import 'package:doing_doing_clone/api/api_todos.dart';
import 'package:doing_doing_clone/model/model_diary.dart';
import 'package:doing_doing_clone/model/model_todo.dart';
import 'package:doing_doing_clone/widget/empty_todos.dart';
import 'package:doing_doing_clone/widget/todo_editor/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:doing_doing_clone/widget/diary/emotion_input.dart';
import 'package:doing_doing_clone/widget/diary/write_button.dart';

class DiaryViewer extends StatefulWidget {
  DateTime dateTime;

  DiaryViewer({
    Key? key,
    required this.dateTime
  }): super (key: key);

  @override
  _DiaryViewerState createState() => _DiaryViewerState();
}

class _DiaryViewerState extends State<DiaryViewer> {
  final TextEditingController _diaryTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Diary?>(
        future: DiariesApi.readDiary(widget.dateTime),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Diary? diary = snapshot.data;
            _diaryTextController.text = diary?.diary ?? '';

            return Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 28),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2)),
                          child: Column(
                              children: [
                                const Text(
                                  "-- Doing Doing --",
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 40),

                                StreamBuilder<List<Todo>>(
                                    stream: TodosApi.readTodos(diary!.dateTime),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final todos = snapshot.data ?? List.empty();

                                        return Wrap(
                                            runSpacing: 8,
                                            children: todos.map((todo) =>
                                                TodoItem(todo: todo)).toList()
                                        );
                                      } else {
                                        return const EmptyTodos();
                                      }
                                    }
                                ),

                                const SizedBox(height: 40),
                                EmotionInput(),
                                const SizedBox(height: 40),
                                if (diary.isDiaryDisplayed == true) TextField(
                                  controller: _diaryTextController,
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      hintText: "오늘은 어떤 하루였나요?", border: InputBorder.none),
                                )
                              ]
                          )
                      ),
                      Positioned(top: 16, right: 16, child: WriteButton(diary: diary)),
                    ]));
          } else {
            return const Expanded(child: Center(child: Text("할 일을 등록해주세요!")));
          }
        }
    );
  }
}
