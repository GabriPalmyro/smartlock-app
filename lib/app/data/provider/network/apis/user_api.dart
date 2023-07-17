import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:smartlock_app/app/data/provider/network/api_endpoint.dart';
import 'package:smartlock_app/app/data/provider/network/api_provider.dart';
import 'package:smartlock_app/app/data/provider/network/api_request_representable.dart';

enum UserType {
  create,
  login,
  getByID,
}

class UserAPI implements APIRequestRepresentable {
  final UserType type;
  String? id;

  @override
  HTTPMethod method;

  @override
  dynamic body;

  UserAPI._({
    required this.type,
    required this.method,
    this.id,
    this.body,
  });

  UserAPI.login(dynamic body)
      : this._(
          type: UserType.login,
          method: HTTPMethod.post,
          body: body
        );

  UserAPI.getById(String id)
      : this._(
          type: UserType.getByID,
          method: HTTPMethod.get,
          id: id,
        );

  @override
  String get path {
    switch (type) {
      case UserType.create:
        return '/user';
      case UserType.login:
        return '/user/login';
      case UserType.getByID:
        return '/users/$id';
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
