import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Utils {
  /* Firebase Utils */
  static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<T>> transformer<T>(
          T Function(Map<String, dynamic> json, String id) fromJson
      ) => StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<T>>.fromHandlers(
        handleData: (QuerySnapshot<Map<String, dynamic>> data, EventSink<List<T>> sink)
        {
          final objects = data.docs.map((doc) {
            return fromJson(doc.data(), doc.reference.id);
          }).toList();

          sink.add(objects);
        },
      );

  /* Date Utils */
  static String? toDateString(Timestamp? value) {
    if (value == null) return null;

    DateTime dateTime = value.toDate();

    return DateFormat("yyyy-MM-dd").format(dateTime);
  }

  static DateTime? toDateTime(Timestamp? value) {
    if (value == null) return null;

    return value.toDate();
  }

  static dynamic fromDateTimeToJson(DateTime dateTime) {
    return dateTime.toUtc();
  }
}
