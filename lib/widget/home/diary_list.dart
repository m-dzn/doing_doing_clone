import 'package:doing_doing_clone/api/api_diaries.dart';
import 'package:doing_doing_clone/provider/year_month_provider.dart';
import 'package:flutter/material.dart';
import 'package:doing_doing_clone/model/model_diary.dart';
import 'package:doing_doing_clone/widget/home/diary_item.dart';
import 'package:provider/provider.dart';

class DiaryList extends StatefulWidget {
  const DiaryList({
    super.key
  });

  @override
  _DiaryListState createState() => _DiaryListState();
}

class _DiaryListState extends State<DiaryList> {
  late YearMonthProvider _yearMonthProvider;

  @override
  Widget build(BuildContext context) {
    _yearMonthProvider = Provider.of(context);

    return Container(
        margin: const EdgeInsets.all(24),
        child: StreamBuilder<List<Diary>>(
          stream: DiariesApi.readDiaries(_yearMonthProvider.yearMonth),
          builder: (context, snapshot) {
            List<Diary>? diaries = snapshot.data;

            if (diaries == null) return Text("");

            return GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 1.5
              ),
              primary: false,
              shrinkWrap: true,
              children: diaries.map((Diary diary) =>
                  DiaryItem(
                    diary: diary
                  )
              ).toList()
            );
          }
        )
    );
  }
}

// GridView.count(
// crossAxisCount: 2,
// crossAxisSpacing: 24,
// mainAxisSpacing: 24,
// childAspectRatio: (5 / 8),
// children: List.generate(4, (index) {
// //item 의 반복문 항목 형성
// return DiaryItem(
// diary: Diary(date: DateTime.now(), emotion: 'ANGRY'));
// }))
