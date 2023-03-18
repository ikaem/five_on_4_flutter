import 'dart:developer';

import 'package:five_on_4_flutter/src/features/auth/domain/models/auth/model.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:flutter/material.dart';

class InitialDataProvider extends ChangeNotifier {
  InitialDataProvider();

  // note sure these should be here
  AuthModel? _auth;
  PlayerModel? _currentPlayer;

  bool _isLoading = false;

  bool get isEmpty => _auth == null && _currentPlayer == null;
  bool get isComplete => _auth != null && _currentPlayer != null;
  bool get isInitialDataLoadedSuccessfully =>
      auth != null && currentPlayer != null;
  bool get isLoading => _isLoading;
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

  void set isLoading(bool isDataLoading) {
    _isLoading = isDataLoading;
    notifyListeners();
  }

  void setInitialData({
    required AuthModel? auth,
    required PlayerModel? player,
  }) {
    _isLoading = false;
    _auth = auth;
    _currentPlayer = player;

    // TODO DO THIS only for dev later
    log('This is the player that logged in: ${player}');

    notifyListeners();
  }
}
