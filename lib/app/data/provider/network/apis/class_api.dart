import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:smartlock_app/app/data/provider/network/api_endpoint.dart';
import 'package:smartlock_app/app/data/provider/network/api_provider.dart';
import 'package:smartlock_app/app/data/provider/network/api_request_representable.dart';

enum ClassType { getClassesForTeacherFromToday }

class ClassAPI implements APIRequestRepresentable {
  final ClassType type;
  String? id;

  @override
  HTTPMethod method;

  @override
  dynamic body;

  ClassAPI._({
    required this.type,
    required this.method,
    this.id,
    this.body,
  });

  ClassAPI.getClassesForTeacherFromToday(String id)
      : this._(
            type: ClassType.getClassesForTeacherFromToday,
            method: HTTPMethod.get,
            id: id);

  @override
  String get path {
    switch (type) {
      case ClassType.getClassesForTeacherFromToday:
        return '/class/teacher/$id/today';
      default:
        return '';
    }
  }

  @override
  Map<String, String> get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  Map<String, String> get query {
    return {HttpHeaders.contentTypeHeader: 'application/json'};
  }

  @override
  Future<Either<AppException, dynamic>> request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;

  @override
  String get endpoint => APIEndpoint.api;
}
