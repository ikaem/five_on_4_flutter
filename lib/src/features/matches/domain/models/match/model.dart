// TODO later, use freezed for this
import 'package:five_on_4_flutter/src/features/matches/data/data.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/enums/enums.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/models/match_participant/model.dart';

class MatchModel {
  const MatchModel({
    required this.id,
    required this.name,
    // TODO this should be actual players later
    required this.joinedParticipants,
    required this.invitedParticipants,
  });
  factory MatchModel.fromRemoteDto(MatchRemoteDTO remoteDto) {
    final List<MatchParticipantModel> allParticipants = remoteDto.participants
        .map((p) => MatchParticipantModel.fromRemoteDTO(p))
        .toList();

    final List<MatchParticipantModel> matchJoinedParticipants =
        MatchModelExtension.filterMatchParticipantsByStatus(
      status: MatchParticipantStatus.joined,
      participants: allParticipants,
    );

    final List<MatchParticipantModel> matchInvitedParticipants =
        MatchModelExtension.filterMatchParticipantsByStatus(
      status: MatchParticipantStatus.invited,
      participants: allParticipants,
    );

    final MatchModel match = MatchModel(
      id: remoteDto.id,
      name: remoteDto.name,
      joinedParticipants: matchJoinedParticipants,
      invitedParticipants: matchInvitedParticipants,
    );

    return match;
  }

  // TODO test
  factory MatchModel.fromRandom() {
    final String id = '1';
    final String name = 'Some random match name';
    final List<MatchParticipantModel> joinedParticipants = [];
    final List<MatchParticipantModel> invitedParticipants = [];

    return MatchModel(
      id: id,
      name: name,
      joinedParticipants: joinedParticipants,
      invitedParticipants: invitedParticipants,
    );
  }

  final String id;
  final String name;
  final List<MatchParticipantModel> joinedParticipants;
  final List<MatchParticipantModel> invitedParticipants;
}

// TODO move this to extensions
extension MatchModelExtension on MatchModel {
  static List<MatchParticipantModel> filterMatchParticipantsByStatus({
    required MatchParticipantStatus status,
    required List<MatchParticipantModel> participants,
  }) {
    final List<MatchParticipantModel> filteredParticipants =
        participants.where((p) => p.status == status).toList();

    return filteredParticipants;
  }
}

// TODO move this somewhere
