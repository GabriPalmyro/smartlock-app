class Access {
  String id;
  String accessType;
  DateTime openTime;
  DateTime? closeTime;

  Access({
    required this.id,
    required this.accessType,
    required this.openTime,
    this.closeTime,
  });

  factory Access.fromJson(Map<String, dynamic> json) {
    return Access(
      id: json['id'],
      accessType: json['access_type'],
      openTime: DateTime.parse(json['open_time']),
      closeTime: json['close_time'] != null ? DateTime.parse(json['close_time']) : null,
    );
  }
}