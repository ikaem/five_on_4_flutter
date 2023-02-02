import 'package:five_on_4_flutter/src/features/auth/auth.dart'
    show AuthRemoteDataSource;
import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:five_on_4_flutter/src/libraries/firebase/firebase.dart';

class AuthRemoteAppDataSource implements AuthRemoteDataSource {
  const AuthRemoteAppDataSource({
    required this.firebaseAuthWrapper,
  });

  final FirebaseAuthWrapper firebaseAuthWrapper;

  @override
  Future<User?> checkAuth() async {
    //   return user;

    try {
      // TODO it also has option for listening to stream, but we dont want that - we will implement our own stream, because might change provider
      final User? user = await firebaseAuthWrapper.checkAuth();

      return user;
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      // TODO will need to check for different exception types
      throw const AuthException(
        message: 'There was an error while checking auth status',
      );
    }
  }

  @override
  Future<User> login(AuthCredentialsArgs credentialsArgs) async {
    try {
      final User? user = await firebaseAuthWrapper
          .loginWithUsernameAndPassword(credentialsArgs);

      if (user == null) {
        throw const AuthLoginFailedException();
      }

      return user;
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      // TODO will need to check for different exception types
      throw const AuthException(
        message: 'There was an error while loging in',
      );
    }
  }

  @override
  Future<User> register(AuthCredentialsArgs credentialsArgs) async {
    try {
      final User? user = await firebaseAuthWrapper
          .registerWithUsernameAndPassword(credentialsArgs);

// TODO not sure if this is correct
// TODO also check why does this allow to be null?
      if (user == null) {
        throw const AuthRegistrationFailedException();
      }

      return user;
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      // TODO will need to check for different exception types
      throw const AuthException(
        message: 'There was an error while registering',
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseAuthWrapper.logout();
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      // TODO will need to check for different exception types
      throw const AuthException(
        message: 'There was an error while logging out',
      );
    }
  }
}
