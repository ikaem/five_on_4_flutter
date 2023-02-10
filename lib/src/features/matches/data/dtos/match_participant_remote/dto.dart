import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';
part 'dto.g.dart';

@freezed
class MatchParticipantRemoteDTO with _$MatchParticipantRemoteDTO {
  const factory MatchParticipantRemoteDTO({
    required String id,
    required String userId,
    required String nickname,
  }) = _MatchParticipantRemoteDTO;

  factory MatchParticipantRemoteDTO.fromJson(Map<String, dynamic> map) =>
      _$MatchParticipantRemoteDTOFromJson(map);
}
