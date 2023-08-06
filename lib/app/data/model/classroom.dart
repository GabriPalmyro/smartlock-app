

class Classroom {
  String id;
  String block;
  String name;

  Classroom({
    required this.id,
    required this.block,
    required this.name,
  });

  factory Classroom.fromJson(Map<String, dynamic> json) {
    return Classroom(
      id: json['id'],
      block: json['block'],
      name: json['name'],
    );
  }
}
