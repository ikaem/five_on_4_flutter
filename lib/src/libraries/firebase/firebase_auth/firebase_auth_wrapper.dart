import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_on_4_flutter/src/domain/domain.dart';

class FirebaseAuthWrapper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? checkAuth() {
    try {
      final User? auth = _auth.currentUser;

      return auth;
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw const AuthException(
        message: 'There was an error while checking auth status',
      );
    }
  }
}
