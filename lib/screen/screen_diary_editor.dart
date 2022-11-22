import 'package:flutter/material.dart';
import 'package:doing_doing_clone/widget/common/custom_app_bar.dart';
import 'package:doing_doing_clone/widget/common/dd_text_field.dart';
import 'package:doing_doing_clone/widget/common/name_sticker.dart';
import 'package:doing_doing_clone/widget/todo/todo_editor.dart';

class DiaryEditorScreen extends StatefulWidget {
  const DiaryEditorScreen({Key? key}) : super(key: key);

  @override
  State<DiaryEditorScreen> createState() => _DiaryEditorScreenState();
}

class _DiaryEditorScreenState extends State<DiaryEditorScreen> {
  bool _isShow = false;

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
                      Expanded(child: DDTextField()),
                    ]
                ),
                const SizedBox(height: 24),
                const TodoEditor(),
                Container( // 일기 내용 보이기
                  padding: const EdgeInsets.only(left: 16, right: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('일기 내용 보이기', style: TextStyle(fontSize: 16)),
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
                    icon: const Icon(Icons.delete_outlined, color: Colors.black),
                    label: const Text('삭제', style: TextStyle(color: Colors.black),),
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
