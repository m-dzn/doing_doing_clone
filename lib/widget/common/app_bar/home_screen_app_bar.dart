import 'package:doing_doing_clone/provider/year_month_provider.dart';
import 'package:doing_doing_clone/widget/common/app_bar/diary_app_bar_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  DateFormat dateFormat = DateFormat("yyyy년 MM월");
  late YearMonthProvider _yearMonthProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _yearMonthProvider = Provider.of(context);

    return PreferredSize(
        preferredSize: widget.preferredSize,
        child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                children: <Widget>[
                  TextButton(
                    child: Text(
                        dateFormat.format(_yearMonthProvider.yearMonth),
                        style: const TextStyle(fontSize: 18, color: Colors.black)),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101)
                      );

                      if (pickedDate != null) _yearMonthProvider.changeYearMonth(pickedDate);
                    },
                  ),
                  const Spacer(),
                  const DiaryAppBarMenu()
                ]
            )
        )
    );
  }
}