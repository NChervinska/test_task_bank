import 'package:intl/intl.dart';

extension DateExt on DateTime {
  static String? toJson(DateTime? date) {
    if (date == null) return null;

    return DateFormat('dd.MM.yyyy').format(date);
  }

  static DateTime? fromJson(String? json) {
    if (json == null) return null;

    return DateTime.tryParse(json);
  }
}
