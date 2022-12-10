import 'package:doing_doing_clone/model/model_diary.dart';
import 'package:flutter/material.dart';
import 'package:doing_doing_clone/widget/common/custom_app_bar.dart';
import 'package:doing_doing_clone/widget/common/dd_text_field.dart';
import 'package:doing_doing_clone/widget/common/name_sticker.dart';
import 'package:doing_doing_clone/widget/todo_editor/todo_editor.dart';
import 'package:intl/intl.dart';

class DiaryEditorScreen extends StatefulWidget {
  final Diary? diary;

  const DiaryEditorScreen({
    Key? key,
    this.diary
  }) : super(key: key);

  @override
  State<DiaryEditorScreen> createState() => _DiaryEditorScreenState();
}

class _DiaryEditorScreenState extends State<DiaryEditorScreen> {
  bool _isShow = false;
  final TextEditingController _dateTextController = TextEditingController();
  final DateFormat dateFormat = DateFormat('yyyy년 MM월 dd일 (E)', 'ko');
  DateTime? date;

  @override
  void initState() {
    super.initState();

    // 기본 날짜값이 있으면 보여줍니다.
    setState(() {
      date = widget.diary?.dateTime;
    });
    if (date != null) {
      _dateTextController.text = dateFormat.format(date!);
    }
  }

  @override
  void dispose() {
    _dateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const CustomAppBar(),
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
                                  setState(() {
                                    date = pickedDate;
                                  });
                                  _dateTextController.text = dateFormat.format(
                                      date!);
                                }
                              },
                            )),
                          ]
                      ),
                      const SizedBox(height: 24),

                      TodoEditor(date: date),

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
                                  value: _isShow,
                                  onChanged: (value) {
                                    setState(() {
                                      _isShow = value;
                                    });
                                  }
                              )
                            ]
                        ),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: TextButton.icon(
                          icon: const Icon(
                              Icons.delete_outlined, color: Colors.black),
                          label: const Text(
                            '삭제', style: TextStyle(color: Colors.black),),
                          onPressed: () {},
                        ),
                      )
                    ]
                )
            )
        )
    );
  }
}