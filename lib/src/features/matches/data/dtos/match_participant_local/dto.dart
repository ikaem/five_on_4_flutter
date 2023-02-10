import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:isar/isar.dart';

part 'dto.g.dart';

@embedded
class MatchParticipantLocalDTO {
  // TODO apparent this cannot be here
  // const MatchParticipantLocalDTO({
  //   required this.id,
  //   required this.userId,
  //   required this.nickname,
  // });

  MatchParticipantLocalDTO({
    this.id,
    this.userId,
    this.nickname,
  }
      // this.id,
      // this.userId,
      // this.nickname,
      );

  factory MatchParticipantLocalDTO.fromRemoteDTO(
      MatchParticipantRemoteDTO remoteDTO) {
    final MatchParticipantLocalDTO localDTO = MatchParticipantLocalDTO(
      id: remoteDTO.id,
      userId: remoteDTO.userId,
      nickname: remoteDTO.nickname,
    );

    return localDTO;
  }

  // Id get isarId => fastHash(id);

  final String? id;
  final String? userId;
  final String? nickname;
}
