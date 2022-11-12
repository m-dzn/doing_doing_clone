class Diary {
  DateTime date;
  String emotion;
  String? diary;
  bool? isDiaryDisplayed;

  Diary({
    required this.date,
    required this.emotion,
    this.diary,
    this.isDiaryDisplayed
  });

  Diary.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        emotion = json['emotion'],
        diary = json['diary'],
        isDiaryDisplayed = json['isDiaryDisplayed'];
}