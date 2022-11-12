import 'package:doing_doing_clone/screen/screen_home.dart';
import 'package:doing_doing_clone/service/app.theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
