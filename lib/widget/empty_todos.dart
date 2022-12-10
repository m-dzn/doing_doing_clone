import 'package:flutter/material.dart';

class EmptyTodos extends StatelessWidget {
  const EmptyTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Something Went Wrong Try later',
            style: TextStyle(fontSize: 24, color: Colors.white)));
  }
}
