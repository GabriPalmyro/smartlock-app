// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:smartlock_app/app/data/model/access.dart';
import 'package:smartlock_app/app/data/model/lock.dart';
import 'package:smartlock_app/app/data/model/next_class.dart';

class ClassroomInfos {
  String id;
  String block;
  String name;
  Lock? lock;
  List<Access> access;
  List<NextClass> nextClasses;

  ClassroomInfos({
    required this.id,
    required this.block,
    required this.name,
    required this.lock,
    required this.access,
    required this.nextClasses,
  });

  factory ClassroomInfos.fromJson(Map<String, dynamic> json) {
    final accessList = json['access'] as List;
    final nextClassList = json['next_class'] as List;
    final List<Access> accesses =
        accessList.map((item) => Access.fromJson(item)).toList();
    final List<NextClass> classess =
        nextClassList.map((item) => NextClass.fromJson(item)).toList();
    final lock = json['lock'] != null ? Lock.fromJson(json['lock']) : null;

    return ClassroomInfos(
      id: json['id'],
      block: json['block'],
      name: json['name'],
      lock: lock,
      access: accesses,
      nextClasses: classess,
    );
  }

  @override
  String toString() {
    return 'ClassroomInfos(id: $id, block: $block, name: $name, lock: $lock, access: $access, nextClasses: $nextClasses)';
  }
}
