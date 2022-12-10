import 'package:doing_doing_clone/utils.dart';

class DiaryField {
  static const id                 = 'id';
  static const dateTime               = 'dateTime';
  static const emotion            = 'emotion';
  static const diary              = 'diary';
  static const isDiaryDisplayed   = 'isDiaryDisplayed';
}

class Diary {
  String?   id;
  DateTime  dateTime;
  String    emotion;
  String?   diary;
  bool?     isDiaryDisplayed;

  Diary({
    this.id,
    DateTime? dateTime,
    required this.emotion,
    this.diary,
    this.isDiaryDisplayed = true
  }) : dateTime  = dateTime ?? DateTime.now();

  static Diary fromJson(Map<String, dynamic> json) => Diary(
        id:                 json[DiaryField.id],
        dateTime:           Utils.toDateTime(json[DiaryField.dateTime]),
        emotion:            json[DiaryField.emotion],
        diary:              json[DiaryField.diary],
        isDiaryDisplayed:   json[DiaryField.isDiaryDisplayed]
  );

  // 객체를 JSON으로 serialize합니다. (FireStore 저장 시 사용)
  Map<String, dynamic> toJson() => {
    DiaryField.dateTime:              Utils.fromDateTimeToJson(dateTime),
    DiaryField.emotion:           emotion,
    DiaryField.diary:             diary,
    DiaryField.isDiaryDisplayed:  isDiaryDisplayed,
  };
}