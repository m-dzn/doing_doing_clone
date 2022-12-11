import 'package:doing_doing_clone/widget/common/app_bar/home_screen_app_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:doing_doing_clone/widget/home/diary_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// Home Screen의 상태값
class _HomeScreenState extends State<HomeScreen> {
  Future<void> init(String collection) async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          appBar: HomeScreenAppBar(),
          body: Center(child: DiaryList()),
        )
    );
  }
}
