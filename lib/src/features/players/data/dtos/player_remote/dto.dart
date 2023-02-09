import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';
part 'dto.g.dart';

@freezed
class PlayerRemoteDTO with _$PlayerRemoteDTO {
  const factory PlayerRemoteDTO({
    required String id,
    required String userId,
    required String name,
  }) = _PlayerRemoteDTO;

  factory PlayerRemoteDTO.fromJson(Map<String, dynamic> map) =>
      _$PlayerRemoteDTOFromJson(map);
}
