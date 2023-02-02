import 'package:flutter/material.dart';

@immutable
class AuthCredentialsArgs {
  const AuthCredentialsArgs({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
