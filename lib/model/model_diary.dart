import 'package:doing_doing_clone/utils.dart';

class DiaryField {
  static const id                 = 'id';
  static const date               = 'date';
  static const emotion            = 'emotion';
  static const diary              = 'diary';
  static const isDiaryDisplayed   = 'isDiaryDisplayed';
}

class Diary {
  String?   id;
  DateTime  date;
  String    emotion;
  String?   diary;
  bool?     isDiaryDisplayed;

  Diary({
    this.id,
    DateTime? date,
    required this.emotion,
    this.diary,
    this.isDiaryDisplayed = true
  }) : date  = date ?? DateTime.now();

  static Diary fromJson(Map<String, dynamic> json) => Diary(
        id:                 json[DiaryField.id],
        date:               Utils.toDateTime(json[DiaryField.date]),
        emotion:            json[DiaryField.emotion],
        diary:              json[DiaryField.diary],
        isDiaryDisplayed:   json[DiaryField.isDiaryDisplayed]
  );

  // 객체를 JSON으로 serialize합니다. (FireStore 저장 시 사용)
  Map<String, dynamic> toJson() => {
    DiaryField.date:              Utils.fromDateTimeToJson(date),
    DiaryField.emotion:           emotion,
    DiaryField.diary:             diary,
    DiaryField.isDiaryDisplayed:  isDiaryDisplayed,
  };
}