import 'package:five_on_4_flutter/src/features/auth/auth.dart';
import 'package:five_on_4_flutter/src/libraries/libraries.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    required String id,
    required String name,
    required String email,
  }) = _AuthModel;

  factory AuthModel.fromLocalDTO(AuthLocalDTO dto) {
    final AuthModel model = AuthModel(
      id: dto.id,
      name: dto.name,
      email: dto.email,
    );

    return model;
  }

  factory AuthModel.fromFirebaseUser(User user) {
    final AuthModel model = AuthModel(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email!,
    );

    return model;
  }
}
