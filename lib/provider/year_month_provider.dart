import 'package:flutter/material.dart';

class YearMonthProvider extends ChangeNotifier {
  DateTime _yearMonth = DateTime.now();

  DateTime get yearMonth => _yearMonth;

  void changeYearMonth(DateTime yearMonth) {
    _yearMonth = yearMonth;
    notifyListeners();
  }
}