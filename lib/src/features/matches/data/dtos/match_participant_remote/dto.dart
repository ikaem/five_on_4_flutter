import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/enums/enums.dart';
import 'package:five_on_4_flutter/src/features/players/data/dtos/dtos.dart';
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
    required String status,
    required int createdAt,
    required int? expiresAt,
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
      createdAt: DateTime.now().millisecondsSinceEpoch,
      expiresAt: null,
      status: MatchParticipantStatus.joined.name,
    );

    return participantRemoteDTO;
  }

  factory MatchParticipantRemoteDTO.fromFirestoreSnapshot({
    required String matchId,
    required QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
  }) {
    final Map<String, dynamic> participantData = snapshot.data();

    final Timestamp? participantDataExpiresAt =
        participantData['expiresAt'] as Timestamp?;

    final String participantId = snapshot.id;
    final String userId = participantData['playerId'] as String;
    final String nickname = participantData['nickname'] as String;
    final String status = participantData['status'] as String;
    final int createdAt = (participantData['createdAt'] as Timestamp)
        .toDate()
        .millisecondsSinceEpoch;
    final int? expiresAt = participantDataExpiresAt == null
        ? null
        : participantDataExpiresAt.toDate().millisecondsSinceEpoch;
    ;

    final MatchParticipantRemoteDTO remoteDTO = MatchParticipantRemoteDTO(
      id: participantId,
      userId: userId,
      matchId: matchId,
      nickname: nickname,
      status: status,
      createdAt: createdAt,
      expiresAt: expiresAt,
    );

    return remoteDTO;
  }

  factory MatchParticipantRemoteDTO.fromJson(Map<String, dynamic> map) =>
      _$MatchParticipantRemoteDTOFromJson(map);
}
