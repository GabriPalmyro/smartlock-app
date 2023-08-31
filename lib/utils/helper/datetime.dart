import 'package:flutter/material.dart';

List<String> months = [
  'Janeiro',
  'Fevereiro',
  'Março',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro'
];

String convertDateTimeToString(DateTime date) =>
    '${date.day} de ${months[date.month - 1]} de ${date.year}';

String convertDateTimeToStringTime(DateTime date) =>
    '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';

String convertTimeOfDayToString(TimeOfDay time) =>
    '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

String convertDateTimeToStringJSON(DateTime date) =>
    '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

final List<String> daysOfWeek = [
  'Seg',
  'Ter',
  'Qua',
  'Qui',
  'Sex',
  'Sáb',
  'Dom'
];

DateTime calculateNextClassDate(int classDayOfWeek) {
    final DateTime now = DateTime.now();
    final int daysUntilClass = ((classDayOfWeek - now.weekday + 7) % 7) + 1;
    final DateTime nextClassDate = now.add(Duration(days: daysUntilClass));

    return nextClassDate;
  }