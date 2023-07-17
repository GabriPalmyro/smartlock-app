import 'package:smartlock_app/app/data/model/access.dart';

class Classroom {
  String id;
  String block;
  String name;
  List<Access> access;

  Classroom({
    required this.id,
    required this.block,
    required this.name,
    required this.access,
  });

  factory Classroom.fromJson(Map<String, dynamic> json) {
    final accessList = json['access'] as List;
    final List<Access> accesses =
        accessList.map((item) => Access.fromJson(item)).toList();

    return Classroom(
      id: json['id'],
      block: json['block'],
      name: json['name'],
      access: accesses,
    );
  }
}
