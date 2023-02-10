import 'package:flutter/material.dart';

@immutable
class PlayerArgs {
  const PlayerArgs({
    required this.authId,
    required this.nickname,
    required this.email,
  });

  final String authId;
  final String nickname;
  final String email;
}
