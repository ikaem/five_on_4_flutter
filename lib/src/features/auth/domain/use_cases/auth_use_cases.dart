import 'dart:async';

import 'package:five_on_4_flutter/src/features/auth/data/data.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/models/auth/auth.dart';

typedef OnAuthEvent = void Function(AuthModel? event);
typedef OnAuthEventException = void Function(Object e);

class AuthUseCases {
  AuthUseCases({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  late final StreamSubscription<AuthModel?> _authSubscription =
      authRepository.observeAuth.listen((auth) => auth);

  Future<void> login(AuthCredentialsArgs credentialsArgs) async {
    await authRepository.login(credentialsArgs);
  }

  Future<void> logout() async {
    await authRepository.logout();
  }

  Future<void> checkAuth() async {
    await authRepository.checkAuth();
  }

  Future<void> register(AuthCredentialsArgs credentialsArgs) async {
    await authRepository.register(credentialsArgs);
  }

  void handleAuthSubscription({
    required OnAuthEvent onAuthEvent,
    required OnAuthEventException onAuthEventException,
  }) {
    _authSubscription.onData(onAuthEvent);
    _authSubscription.onError(onAuthEventException);
  }

  Future<void> cancelAuthSubscription() => _authSubscription.cancel();
}
