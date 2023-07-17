class User {
  String id;
  String name;
  String email;
  String code;
  DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.code,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      code: json['code'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'code': code,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
