import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';
part 'dto.g.dart';

@freezed
class MatchRemoteDTO with _$MatchRemoteDTO {
  const factory MatchRemoteDTO({
    required String id,
    required String name,
    required List<MatchParticipantRemoteDTO> participants,
  }) = _MatchRemoteDTO;

  factory MatchRemoteDTO.fromFirestoreSnapshots({
    required DocumentSnapshot<Map<String, dynamic>> matchSnapshot,
    required List<QueryDocumentSnapshot<Map<String, dynamic>>>
        participantsSnapshots,
  }) {
    final Map<String, dynamic> matchData = matchSnapshot.data()!;

    final String matchId = matchSnapshot.id;
    final String matchName = matchData['name'] as String;

    final List<MatchParticipantRemoteDTO> matchParticipants =
        participantsSnapshots.map((ps) {
      final MatchParticipantRemoteDTO participantRemoteDTO =
          MatchParticipantRemoteDTO.fromFirestoreSnapshot(
        snapshot: ps,
        matchId: matchId,
      );

      return participantRemoteDTO;
    }).toList();

    final MatchRemoteDTO matchRemoteDTO = MatchRemoteDTO(
      id: matchId,
      name: matchName,
      participants: matchParticipants,
    );

    return matchRemoteDTO;
  }

  factory MatchRemoteDTO.fromJson(Map<String, dynamic> map) =>
      _$MatchRemoteDTOFromJson(map);
}
