import 'package:five_on_4_flutter/src/features/auth/domain/args/args.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/models/auth/auth.dart';

abstract class AuthRepository {
  Stream<AuthModel?> get observeAuth;
  Future<void> login(LoginCredentialsArgs credentialsArgs);
  Future<String> register(RegisterCredentialsArgs credentialsArgs);
  Future<void> logout();
  Future<void> checkAuth();
  Future<AuthModel?> get auth;
}
