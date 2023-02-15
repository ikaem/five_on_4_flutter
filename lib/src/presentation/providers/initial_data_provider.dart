import 'package:five_on_4_flutter/src/features/auth/domain/models/auth/model.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:flutter/material.dart';

class AppInitialDataProvider extends ChangeNotifier {
  AppInitialDataProvider();

  // note sure these should be here
  AuthModel? _auth;
  PlayerModel? _currentPlayer;

  bool get isLoggedIn => _auth != null;
  bool get isCurrentPlayerLoaded => _currentPlayer != null;

  AuthModel? get auth => _auth;
  PlayerModel? get currentPlayer => _currentPlayer;

  void set auth(AuthModel? auth) {
    _auth = auth;
    notifyListeners();
  }

  void set currentPlayer(PlayerModel? player) {
    _currentPlayer = player;
    notifyListeners();
  }

  void setInitialData({
    required AuthModel? auth,
    required PlayerModel? player,
  }) {
    _auth = auth;
    _currentPlayer = player;

    notifyListeners();
  }
}
