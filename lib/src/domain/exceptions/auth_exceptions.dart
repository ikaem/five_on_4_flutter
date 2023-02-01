import 'package:flutter/material.dart';

@immutable
class AuthException implements Exception {
  const AuthException({
    this.message,
  });

  final String? message;

  @override
  String toString() => 'AuthException - $message';
}

@immutable
class AuthUserNotFoundException extends AuthException {
  const AuthUserNotFoundException();

  @override
  String toString() => 'AuthUserNotFoundException';
}

@immutable
class AuthUnauthorizedException extends AuthException {
  const AuthUnauthorizedException();

  @override
  String toString() => 'AuthUnauthorizedException';
}

@immutable
class AuthInvalidCredentialsException extends AuthException {
  const AuthInvalidCredentialsException();

  @override
  String toString() => 'AuthInvalidCredentialsException';
}
