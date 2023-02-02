import 'package:five_on_4_flutter/src/features/auth/auth.dart'
    show AuthLocalDTO;

abstract class AuthLocalDataSource {
  // TODO this is in theory local too, but lets keep it here - we might be reaching out to backend as well to get actual user
  Future<AuthLocalDTO?> getAuth();
  Future<void> saveAuth(AuthLocalDTO auth);
  Future<void> deleteAuth();
}
