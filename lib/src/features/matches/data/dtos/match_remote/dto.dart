import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';
part 'dto.g.dart';

@freezed
// TODO this will have much more fields
class MatchRemoteDTO with _$MatchRemoteDTO {
  const factory MatchRemoteDTO({
    required String id,
    required String name,
    // TODO in the future, we will have to make this something like status of player joined - so again some reference or something - or just keep it in the database
    required List<MatchParticipantRemoteDTO> participants,
  }) = _MatchRemoteDTO;

  factory MatchRemoteDTO.fromFirestore(Map<String, dynamic> map) {
// TODO this could all potentiually be handled though json by json serializer
    // final List<MatchParticipantRemoteDTO> matchParticipantDTOs =
    //     (map['participants'] as List<Map<String, dynamic>>)
    //         .map((p) => MatchParticipantRemoteDTO.fromFirestore(p))
    //         .toList();

    final MatchRemoteDTO matchDTO = MatchRemoteDTO(
      id: map['id'] as String,
      name: map['name'] as String,
      participants: [],
    );

    return matchDTO;
  }

  factory MatchRemoteDTO.fromJson(Map<String, dynamic> map) =>
      _$MatchRemoteDTOFromJson(map);
}
