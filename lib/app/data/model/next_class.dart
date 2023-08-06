class NextClass {
  String id;
  String name;
  int dayOffTheWeek;
  DateTime initialTime;
  DateTime endTime;

  NextClass({
    required this.id,
    required this.name,
    required this.initialTime,
    required this.endTime,
    required this.dayOffTheWeek,
  });

  factory NextClass.fromJson(Map<String, dynamic> json) {
    return NextClass(
      id: json['id'],
      name: json['name'],
      initialTime: DateTime.parse(json['initialTime']),
      endTime: DateTime.parse(json['endTime']),
      dayOffTheWeek: json['dayOfTheWeek'],
    );
  }
}
