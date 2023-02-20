import 'package:five_on_4_flutter/src/features/players/data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';
part 'dto.g.dart';

@freezed
class MatchParticipantRemoteDTO with _$MatchParticipantRemoteDTO {
  const factory MatchParticipantRemoteDTO({
    required String id,
    // TODO this should be renamed to player id
    required String userId,
    required String matchId,
    required String nickname,
  }) = _MatchParticipantRemoteDTO;

  factory MatchParticipantRemoteDTO.fromPlayerRemoteDTO({
    required String id,
    required String matchId,
    required PlayerRemoteDTO playerRemoteDTO,
  }) {
    final MatchParticipantRemoteDTO participantRemoteDTO =
        MatchParticipantRemoteDTO(
      id: id,
      userId: playerRemoteDTO.id,
      matchId: matchId,
      nickname: playerRemoteDTO.nickname,
    );

    return participantRemoteDTO;
  }

  factory MatchParticipantRemoteDTO.fromJson(Map<String, dynamic> map) =>
      _$MatchParticipantRemoteDTOFromJson(map);
}
