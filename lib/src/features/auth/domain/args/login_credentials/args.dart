import 'package:flutter/material.dart';

@immutable
class LoginCredentialsArgs {
  const LoginCredentialsArgs({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
