import 'package:flutter/material.dart';

@immutable
class MatchesRemoteException implements Exception {
  const MatchesRemoteException({
    this.message,
  });

  final String? message;

  @override
  String toString() => 'MatchesRemoteException: $message';
}

@immutable
class MatchesRemoteNotFoundException extends MatchesRemoteException {
  @override
  String toString() => 'MatchesRemoteNotFoundException';
}
