// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:smartlock_app/app/data/model/classroom.dart';
import 'package:smartlock_app/app/data/model/user.dart';

class Course {
  String id;
  String subject;
  int dayOfTheWeek;
  DateTime initialDay;
  DateTime endDay;
  DateTime initialTimeClass;
  DateTime endTimeClass;
  User teacher;
  Classroom classroom;

  Course({
    required this.id,
    required this.subject,
    required this.dayOfTheWeek,
    required this.initialDay,
    required this.endDay,
    required this.initialTimeClass,
    required this.endTimeClass,
    required this.teacher,
    required this.classroom,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      subject: json['subject'],
      dayOfTheWeek: json['dayOfTheWeek'],
      initialDay: DateTime.parse(json['initialDay']),
      endDay: DateTime.parse(json['endDay']),
      initialTimeClass: DateTime.parse(json['initialTimeClass']),
      endTimeClass: DateTime.parse(json['endTimeClass']),
      teacher: User.fromJson(json['teacher']),
      classroom: Classroom.fromJson(json['classroom']),
    );
  }

  @override
  String toString() {
    return 'Course(id: $id, subject: $subject, dayOfTheWeek: $dayOfTheWeek, initialDay: $initialDay, endDay: $endDay, initialTimeClass: $initialTimeClass, endTimeClass: $endTimeClass, teacher: $teacher, classroom: $classroom)';
  }
}
