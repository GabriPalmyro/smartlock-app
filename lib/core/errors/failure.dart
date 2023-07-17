import 'package:flutter/foundation.dart';

abstract class Failure {
  final String errorMessage;

  Failure({
    StackTrace? stackTrace,
    String? label,
    dynamic exception,
    this.errorMessage = '',
  }) {
    if (stackTrace != null) {
      debugPrintStack(label: label, stackTrace: stackTrace);
    }
    // CRASHALITYCS CAN BE INSERTED HERE
  }
}

class UnknownError extends Failure {
  final String errorMessage;
  final dynamic exception;
  final StackTrace? stackTrace;
  final String? label;

  UnknownError({
    this.errorMessage = 'Erro desconhecido',
    this.label,
    this.stackTrace,
    this.exception,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
        );
}
