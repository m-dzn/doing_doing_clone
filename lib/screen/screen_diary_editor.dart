import 'package:doing_doing_clone/api/api_diaries.dart';
import 'package:doing_doing_clone/model/model_diary.dart';
import 'package:doing_doing_clone/provider/date_time_provider.dart';
import 'package:doing_doing_clone/provider/diaries.dart';
import 'package:flutter/material.dart';
import 'package:doing_doing_clone/widget/common/app_bar/diary_editor_screen_app_bar.dart';
import 'package:doing_doing_clone/widget/common/dd_text_field.dart';
import 'package:doing_doing_clone/widget/common/name_sticker.dart';
import 'package:doing_doing_clone/widget/todo_editor/todo_editor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DiaryEditorScreen extends StatefulWidget {
  const DiaryEditorScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DiaryEditorScreen> createState() => _DiaryEditorScreenState();
}

class _DiaryEditorScreenState extends State<DiaryEditorScreen> {
  late DiariesProvider _diariesProvider;
  late DateTimeProvider _dateTimeProvider;

  late bool _isDiaryDisplayed = true;

  final TextEditingController _dateTextController = TextEditingController();
  final DateFormat dateFormat = DateFormat('yyyy년 MM월 dd일 (E)', 'ko');

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _dateTimeProvider = Provider.of(context, listen: false);
      _dateTextController.text = dateFormat.format(_dateTimeProvider.dateTime);

      _diariesProvider = Provider.of(context, listen: false);
      setState(() {
        _isDiaryDisplayed = _diariesProvider.diary?.isDiaryDisplayed ?? true;
      });
    });
  }

  @override
  void dispose() {
    _dateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _diariesProvider = Provider.of(context);
    _dateTimeProvider = Provider.of(context);

    return SafeArea(
        child: Scaffold(
            appBar: const DiaryEditorScreenAppBar(),
            body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                    children: [
                      Row(
                          children: [
                            const NameSticker(label: '날짜'),
                            const SizedBox(width: 24),
                            Expanded(child: DDTextField(
                              controller: _dateTextController,
                              readOnly: true,
                              hintText: "날짜를 입력해주세요",
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101)
                                );

                                if (pickedDate != null) {
                                  _dateTextController.text = dateFormat.format(pickedDate);
                                  _dateTimeProvider.changeDateTime(pickedDate);
                                }
                              },
                            )),
                          ]
                      ),
                      const SizedBox(height: 24),

                      TodoEditor(date: _diariesProvider.diary?.dateTime),

                      Container( // 일기 내용 보이기
                        padding: const EdgeInsets.only(left: 16, right: 4),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                  '일기 내용 보이기', style: TextStyle(fontSize: 16)),
                              Switch(
                                  inactiveTrackColor: Colors.black12,
                                  activeTrackColor: const Color(0xffF4AEA4),
                                  activeColor: Colors.white,
                                  value: _isDiaryDisplayed,
                                  onChanged: (value) {
                                    if (_diariesProvider.diary != null) {
                                      _diariesProvider.toggleDisplayState(_diariesProvider.diary!);
                                      setState(() {
                                        _isDiaryDisplayed = value;
                                      });
                                    }
                                  }
                              )
                            ]
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (_diariesProvider.diary != null) Center(
                        child: TextButton.icon(
                          icon: const Icon(
                              Icons.delete_outlined, color: Colors.black),
                          label: const Text(
                            '삭제', style: TextStyle(color: Colors.black),),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  content: const Text("이날의 할 일 전체가 삭제됩니다.\n삭제하시겠습니까?"),
                                  actionsAlignment: MainAxisAlignment.center,
                                  actionsPadding: const EdgeInsets.symmetric(vertical: 24),
                                  actions: <Widget>[
                                      TextButton(
                                          child: const Text("삭제", style: TextStyle(color: Colors.red, fontSize: 20)),
                                          onPressed: () {
                                            if (_diariesProvider.diary != null) {
                                              _diariesProvider.removeDiary(_diariesProvider.diary!);

                                              int count = 0;
                                              Navigator.of(context).popUntil((_) => count++ >= 2);
                                            }
                                          }
                                        )

                                  ]
                                )
                            );
                          },
                        ),
                      )
                    ]
                )
            )
        )
    );
  }
}