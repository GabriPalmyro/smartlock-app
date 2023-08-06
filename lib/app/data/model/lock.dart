// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:smartlock_app/app/data/enum/lock_states_enum.dart';

class Lock {
  String id;
  LockState state;
  String name;

  Lock({
    required this.id,
    required this.state,
    required this.name,
  });

  factory Lock.fromJson(Map<String, dynamic> json) {
    return Lock(
      id: json['id'],
      state: json['state'] == false ? LockState.close : LockState.open,
      name: json['name'],
    );
  }

  @override
  String toString() => 'Lock(id: $id, state: $state, name: $name)';
}
