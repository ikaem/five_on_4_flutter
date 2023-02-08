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
class AuthNoSessionException extends AuthException {
  const AuthNoSessionException();

  @override
  String toString() => 'AuthNoSessionException';
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

@immutable
class AuthRegistrationFailedException extends AuthException {
  const AuthRegistrationFailedException();

  @override
  String toString() => 'AuthRegistrationFailedException';
}

@immutable
class AuthLoginFailedException extends AuthException {
  const AuthLoginFailedException();

  @override
  String toString() => 'AuthLoginFailedException';
}
