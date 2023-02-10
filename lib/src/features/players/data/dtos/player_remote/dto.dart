import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';
part 'dto.g.dart';

@freezed
class PlayerRemoteDTO with _$PlayerRemoteDTO {
  const factory PlayerRemoteDTO({
    required String id,
    required String authId,
    required String nickname,
    required String email,
  }) = _PlayerRemoteDTO;

  factory PlayerRemoteDTO.fromJson(Map<String, dynamic> map) =>
      _$PlayerRemoteDTOFromJson(map);
}
