import 'package:five_on_4_flutter/src/features/auth/domain/models/auth/auth.dart';
import 'package:flutter/material.dart';

class AuthStatusProvider extends ChangeNotifier {
  AuthStatusProvider();

  AuthModel? _auth;

  bool get isLoggedIn => _auth != null;
  AuthModel? get auth => _auth;

  void setAuth(AuthModel? auth) {
    _auth = auth;
    notifyListeners();
  }
}
