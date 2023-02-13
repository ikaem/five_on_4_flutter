import 'package:flutter/material.dart';

@immutable
class RegisterCredentialsArgs {
  const RegisterCredentialsArgs({
    required this.email,
    required this.password,
    required this.nickname,
  });

  final String email;
  final String password;
  final String nickname;
}
