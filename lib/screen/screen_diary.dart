import 'package:doing_doing_clone/provider/date_time_provider.dart';
import 'package:doing_doing_clone/widget/common/app_bar/diary_screen_app_bar.dart';
import 'package:doing_doing_clone/widget/diary/diary_nav_bar.dart';
import 'package:doing_doing_clone/widget/diary/diary_viewer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiaryScreen extends StatefulWidget {
  DateTime dateTime;

  DiaryScreen({
    super.key,
    DateTime? dateTime
  }): dateTime = dateTime ?? DateTime.now();

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

// Home Screen의 상태값
class _DiaryScreenState extends State<DiaryScreen> {
  late DateTimeProvider _dateTimeProvider;

  @override
  Widget build(BuildContext context) {
    _dateTimeProvider = Provider.of(context);

    return SafeArea(
          child: Scaffold(
              appBar: const DiaryScreenAppBar(),
              body: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Column(
                    children: [
                      DiaryNavBar(dateTime: _dateTimeProvider.dateTime),
                      const SizedBox(height: 24),
                      DiaryViewer(dateTime: _dateTimeProvider.dateTime)
                    ],
                  )
              )
          )
      );
  }
}
