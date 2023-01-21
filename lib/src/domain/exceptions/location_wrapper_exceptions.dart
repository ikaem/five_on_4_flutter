import 'package:flutter/material.dart';

@immutable
class LocationWrapperException implements Exception {
  const LocationWrapperException({
    required this.message,
  });

  final String message;

  @override
  String toString() => 'LocationWrapperException - $message';
}

@immutable
class LocationWrapperServiceDisabledException extends LocationWrapperException {
  const LocationWrapperServiceDisabledException({
    required super.message,
  });

  @override
  String toString() => 'LocationWrapperServiceDisabledException - $message';
}

@immutable
class LocationWrapperPermissionDeniedException
    extends LocationWrapperException {
  const LocationWrapperPermissionDeniedException({
    required super.message,
  });

  @override
  String toString() => 'LocationWrapperPermissionDeniedException - $message';
}
