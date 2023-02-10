// TODO later, use freezed for this
import 'package:five_on_4_flutter/src/features/matches/data/data.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/models/match_participant/model.dart';

class MatchModel {
  const MatchModel({
    required this.id,
    required this.name,
    // TODO this should be actual players later
    required this.participants,
  });
  factory MatchModel.fromRemoteDto(MatchRemoteDTO remoteDto) {
    final List<MatchParticipantModel> participants = remoteDto.participants
        .map((p) => MatchParticipantModel.fromRemoteDTO(p))
        .toList();

    final MatchModel match = MatchModel(
      id: remoteDto.id,
      name: remoteDto.name,
      participants: participants,
    );

    return match;
  }

  final String id;
  final String name;
  final List<MatchParticipantModel> participants;
}
