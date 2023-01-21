import 'package:flutter/material.dart';

@immutable
class DatabaseException implements Exception {
  const DatabaseException({
    required this.message,
  });

  final String message;

  @override
  String toString() => 'DatabaseException - $message';
}

@immutable
class DatabaseNotInitializedException extends DatabaseException {
  const DatabaseNotInitializedException() : super(message: 'Not initialized');

  @override
  String toString() => 'DatabaseNotInitializedException';
}

@immutable
class DatabaseNotFoundException extends DatabaseException {
  const DatabaseNotFoundException() : super(message: 'Not found');

  @override
  String toString() => 'DatabaseNotFoundException';
}
