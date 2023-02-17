import 'dart:async';

import 'package:five_on_4_flutter/src/features/auth/data/data.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/args/args.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/models/auth/model.dart';
import 'package:five_on_4_flutter/src/libraries/firebase/firebase.dart';
import 'package:rxdart/subjects.dart';

class AuthAppRepository implements AuthRepository {
  AuthAppRepository({
    required this.authLocalDataSource,
    required this.authRemoteDataSource,
  });

  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDataSource authRemoteDataSource;

  final BehaviorSubject<AuthModel?> _authSubject =
      BehaviorSubject<AuthModel?>();

  StreamSink<AuthModel?> get _authSink => _authSubject.sink;

  @override
  Stream<AuthModel?> get observeAuth => _authSubject.stream;

  @override
  Future<AuthModel?> get auth => _authSubject.first;

  @override
  Future<String> login(LoginCredentialsArgs credentialsArgs) async {
    final User user = await authRemoteDataSource.login(credentialsArgs);

    final AuthLocalDTO localDTO = AuthLocalDTO.fromFirebaseUser(user);
    await authLocalDataSource.saveAuth(localDTO);

    final AuthModel authModel = AuthModel.fromFirebaseUser(user);
    _authSink.add(authModel);

    return authModel.id;
  }

  @override
  Future<void> logout() async {
    await authRemoteDataSource.logout();
    await authLocalDataSource.deleteAuth();

    _authSink.add(null);
  }

  @override
  Future<String> register(RegisterCredentialsArgs credentialsArgs) async {
    final User user = await authRemoteDataSource.register(credentialsArgs);

    final AuthLocalDTO localDTO = AuthLocalDTO.fromFirebaseUser(user);
    await authLocalDataSource.saveAuth(localDTO);

    final AuthModel authModel = AuthModel.fromFirebaseUser(user);
    _authSink.add(authModel);

    return authModel.id;
  }

  @override
  Future<String?> checkAuth() async {
// TODO not checking firebase auth local storage for now
    final AuthLocalDTO? localDTO = await authLocalDataSource.getAuth();

    if (localDTO == null) {
      _authSink.add(null);
      return null;
    }

    final AuthModel authModel = AuthModel.fromLocalDTO(localDTO);
    _authSink.add(authModel);

    return authModel.id;
  }
}
