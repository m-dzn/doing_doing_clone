import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String text;
  bool? completed;
  DocumentReference? reference;

  Todo({
    required this.text,
    this.completed,
  });

  // JSON을 객체로 deserialize합니다. (FireStore 조회 시 사용)
  Todo.fromJson(dynamic json, this.reference)
      : text = json['text'],
        completed = json['completed'];

  // 특정 자료를 받아올 때 사용
  Todo.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> snapshot)
    : this.fromJson(snapshot.data(), snapshot.reference);

  // 컬렉션 내에 특정 조건을 만족하는 데이터를 다 가지고 올 때 사용
  Todo.fromQuerySnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data(), snapshot.reference);

  // 객체를 JSON으로 serialize합니다. (FireStore 저장 시 사용)
  Map<String, dynamic> toJson() {
    final map = <String, dynamic> {};
    map['text'] = text;
    map['completed'] = completed;
    return map;
  }
}