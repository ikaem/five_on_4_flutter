import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:five_on_4_flutter/src/libraries/libraries.dart' show User;

abstract class AuthRemoteDataSource {
  // TODO this is in theory local too, but lets keep it here - we might be reaching out to backend as well to get actual user
  Future<User?> checkAuth();
  Future<User> login(LoginCredentialsArgs credentialsArgs);
  Future<User> register(RegisterCredentialsArgs credentialsArgs);
  Future<void> logout();
}
