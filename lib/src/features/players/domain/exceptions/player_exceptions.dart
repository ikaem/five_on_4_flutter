import 'package:flutter/material.dart';

@immutable
class PlayerException implements Exception {
  const PlayerException({
    required this.message,
  });

  final String message;

  @override
  String toString() => 'PlayerException - $message';
}

@immutable
class PlayerNotFoundException extends PlayerException {
  const PlayerNotFoundException({
    required super.message,
  });

  @override
  String toString() => 'PlayerNotFoundException - $message';
}
