import 'package:flutter/material.dart';

class DateTimeProvider extends ChangeNotifier {
  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;

  void changeDateTime(DateTime dateTime) {
    _dateTime = dateTime;
    notifyListeners();
  }
}