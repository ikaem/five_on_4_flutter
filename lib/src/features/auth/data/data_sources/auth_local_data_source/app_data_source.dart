import 'package:five_on_4_flutter/src/features/auth/auth.dart'
    show AuthLocalDataSource;
import 'package:five_on_4_flutter/src/features/auth/data/dtos/auth_local_dto/dto.dart';
import 'package:five_on_4_flutter/src/libraries/libraries.dart';

class AuthLocalAppDataSource implements AuthLocalDataSource {
  const AuthLocalAppDataSource({
    required this.secureStorageWrapper,
  });

  static const String storageIdKey = 'auth_id';
  static const String storageNameKey = 'auth_name';
  static const String storageEmailKey = 'auth_email';

  final SecureStorageWrapper secureStorageWrapper;

  @override
  Future<AuthLocalDTO?> getAuth() async {
    final String? id =
        await secureStorageWrapper.getKeyValue(key: storageIdKey);
    final String? name =
        await secureStorageWrapper.getKeyValue(key: storageNameKey);
    final String? email =
        await secureStorageWrapper.getKeyValue(key: storageEmailKey);

    final AuthLocalDTO? auth = await _handleStorageAuthData(
      id: id,
      name: name,
      email: email,
    );

    return auth;
  }

  @override
  Future<void> deleteAuth() async {
    await Future.wait([
      secureStorageWrapper.deleteKey(key: storageIdKey),
      secureStorageWrapper.deleteKey(key: storageNameKey),
      secureStorageWrapper.deleteKey(key: storageEmailKey),
    ]);
  }

  @override
  Future<void> saveAuth(AuthLocalDTO auth) async {
    await Future.wait([
      secureStorageWrapper.setKey(key: storageIdKey, value: auth.id),
      secureStorageWrapper.setKey(key: storageNameKey, value: auth.name),
      secureStorageWrapper.setKey(key: storageEmailKey, value: auth.email),
    ]);
  }

  Future<AuthLocalDTO?> _handleStorageAuthData({
    required String? id,
    required String? name,
    required String? email,
  }) async {
    final bool isValidData = id != null && name != null && email != null;

    if (!isValidData) {
      await deleteAuth();

      return null;
    }

    final AuthLocalDTO auth = AuthLocalDTO(id: id, name: name, email: email);

    return auth;
  }
}
