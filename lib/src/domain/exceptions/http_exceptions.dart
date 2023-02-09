import 'dart:io';

import 'package:flutter/material.dart';

@immutable
class HttpException implements Exception {
  const HttpException({
    required this.statusCode,
    required this.message,
  });

  final int? statusCode;
  final String message;

  @override
  String toString() => 'HttpException - status: $statusCode, message: $message';
}

@immutable
class HttpUnknownException extends HttpException {
  const HttpUnknownException({
    super.statusCode,
    required super.message,
  });

  @override
  String toString() => 'HttpUnknownException - message: $message';
}

@immutable
class HttpBadRequestException extends HttpException {
  const HttpBadRequestException({
    required super.message,
  }) : super(statusCode: HttpStatus.badRequest);

  @override
  String toString() => 'HttpBadRequestException - message: $message';
}

@immutable
class HttpInternalServerException extends HttpException {
  const HttpInternalServerException({
    required super.message,
  }) : super(statusCode: HttpStatus.internalServerError);

  @override
  String toString() => 'HttpInternalServerException - message: $message';
}

@immutable
class HttpUnathorizedException extends HttpException {
  const HttpUnathorizedException({
    required super.message,
  }) : super(statusCode: HttpStatus.unauthorized);

  @override
  String toString() => 'HttpUnathorizedException - message: $message';
}

@immutable
class HttpNotFoundException extends HttpException {
  const HttpNotFoundException({
    required super.message,
  }) : super(statusCode: HttpStatus.unauthorized);

  @override
  String toString() => 'HttpNotFoundException - message: $message';
}
