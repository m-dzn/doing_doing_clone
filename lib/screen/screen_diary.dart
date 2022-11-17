import 'package:doing_doing_clone/widget/common/custom_app_bar.dart';
import 'package:doing_doing_clone/widget/diary/diary_nav_bar.dart';
import 'package:doing_doing_clone/widget/diary/diary_viewer.dart';
import 'package:flutter/material.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

// Home Screen의 상태값
class _DiaryScreenState extends State<DiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              children: [DiaryNavBar(), const SizedBox(height: 24), DiaryViewer()],
            )));
  }
}