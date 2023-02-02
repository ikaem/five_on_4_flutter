import 'package:five_on_4_flutter/src/libraries/firebase/firebase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';

@freezed
class AuthLocalDTO with _$AuthLocalDTO {
  const factory AuthLocalDTO({
    required String id,
    required String name,
    required String email,
  }) = _AuthLocalDTO;

  factory AuthLocalDTO.fromFirebaseUser(User user) {
    final AuthLocalDTO dto = AuthLocalDTO(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email!,
    );

    return dto;
  }
}
