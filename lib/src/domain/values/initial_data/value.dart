import 'package:five_on_4_flutter/src/features/auth/domain/models/auth/model.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:flutter/material.dart';

@immutable
class InitialDataValue {
  const InitialDataValue({
    required this.auth,
    required this.currentPlayer,
  });

  final AuthModel? auth;
  final PlayerModel? currentPlayer;

  bool get isEmpty => auth == null && currentPlayer == null;
  bool get isComplete => auth != null && currentPlayer != null;

  bool get isLoggedIn => auth != null;
  bool get isCurrentPlayerLoaded => currentPlayer != null;
}
