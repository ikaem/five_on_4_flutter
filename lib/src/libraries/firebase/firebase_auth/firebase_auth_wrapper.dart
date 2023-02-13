import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';

export 'package:firebase_auth/firebase_auth.dart'
    show User, FirebaseAuthException;

class FirebaseAuthWrapper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> checkAuth() async {
    final User? auth = _auth.currentUser;
    return auth;
  }

  Future<User?> registerWithUsernameAndPassword(
    RegisterCredentialsArgs credentialsArgs,
  ) async {
    final UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: credentialsArgs.email,
      password: credentialsArgs.password,
    );

    final User? user = userCredential.user;

    return user;
  }

  Future<User?> loginWithUsernameAndPassword(
    LoginCredentialsArgs credentialsArgs,
  ) async {
    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: credentialsArgs.email,
      password: credentialsArgs.password,
    );

    final User? user = userCredential.user;

    return user;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
