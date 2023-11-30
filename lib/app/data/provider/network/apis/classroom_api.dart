import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:smartlock_app/app/data/provider/network/api_endpoint.dart';
import 'package:smartlock_app/app/data/provider/network/api_provider.dart';
import 'package:smartlock_app/app/data/provider/network/api_request_representable.dart';

enum ClassroomType { getClassroomsFromBlock, getClassroomInfosById, openLockFromClassroom, closeLockFromClassroom }

class ClassroomAPI implements APIRequestRepresentable {
  final ClassroomType type;
  String? id;
  String? userId;
  String? block;

  @override
  HTTPMethod method;

  @override
  dynamic body;

  ClassroomAPI._({
    required this.type,
    required this.method,
    this.id,
    this.userId,
    this.block,
    this.body,
  });

  ClassroomAPI.getClassroomsFromBlock(String block)
      : this._(
          type: ClassroomType.getClassroomsFromBlock,
          method: HTTPMethod.get,
          block: block
        );

  ClassroomAPI.getClassroomInfosById(String id)
      : this._(
          type: ClassroomType.getClassroomInfosById,
          method: HTTPMethod.get,
          id: id
        );

  ClassroomAPI.openLockFromClassroom(String id, String userId)
      : this._(
          type: ClassroomType.openLockFromClassroom,
          method: HTTPMethod.post,
          id: id,
          userId: userId
        );

  ClassroomAPI.closeLockFromClassroom(String id)
      : this._(
          type: ClassroomType.closeLockFromClassroom,
          method: HTTPMethod.post,
          id: id,
        );

  @override
  String get path {
    switch (type) {
      case ClassroomType.getClassroomsFromBlock:
        return '/classroom/block/$block';
      case ClassroomType.getClassroomInfosById:
        return '/classroom/$id';
      case ClassroomType.openLockFromClassroom:
        return '/classroom/$userId/open/$id';
      case ClassroomType.closeLockFromClassroom:
        return '/classroom/close/$id';
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
