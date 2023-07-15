import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smartlock_app/app/data/provider/network/api_request_representable.dart';
import 'package:smartlock_app/constants/string_constants.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 30);
  final dio = Dio();

  static final _singleton = APIProvider();
  static APIProvider get instance => _singleton;

  Future<Either<AppException, dynamic>> request(
      APIRequestRepresentable request) async {
    log('request: ${request.url} ${request.method.string} ${request.body}',
        name: 'Request');

    final response = await dio.request(
      request.url,
      options: Options(
        method: request.method.string,
        headers: request.headers,
        validateStatus: (status) => true,
      ),
      data: request.body,
    );

    return _returnResponse(response);
  }

  Either<AppException, dynamic> _returnResponse(Response<dynamic> response) {
    final statusCode = response.statusCode;
    final responseString = response.data;
    // log(response.toString(), name: 'Response');
    // log(statusCode.toString(), name: 'Response Status Code');

    switch (statusCode) {
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
        return Right(responseString);
      case 400:
        return Left(BadRequestException(responseString['message']));
      case 401:
      case 403:
        return Left(BadRequestException(responseString['message']));
      case 404:
        return Left(BadRequestException(StringConstant.notFoundError));
      case 500:
        return Left(FetchDataException(StringConstant.internalServerError));
      default:
        return Left(FetchDataException(
            'Error occured while Communication with Server with StatusCode : $statusCode'));
    }
  }
}

class AppException implements Exception {
  final dynamic code;
  final dynamic message;
  final dynamic details;

  AppException({required this.code, required this.message, this.details});

  @override
  String toString() {
    return '[$code]: $message \n $details';
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: 'fetch-data',
          message: 'Error During Communication',
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: 'invalid-request',
          message: 'Invalid Request',
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
      : super(
          code: 'unauthorised',
          message: 'Unauthorised',
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
      : super(
          code: 'invalid-input',
          message: 'Invalid Input',
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
      : super(
          code: 'authentication-failed',
          message: 'Authentication Failed',
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: 'request-timeout',
          message: 'Request TimeOut',
          details: details,
        );
}
