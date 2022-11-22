import 'package:flutter/material.dart';
import 'package:doing_doing_clone/widget/common/custom_app_bar.dart';
import 'package:doing_doing_clone/widget/home/diary_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// Home Screen의 상태값
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(),
          body: Center(child: DiaryList()),
        )
    );
  }
}
