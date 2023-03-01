import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';

extension MatchModelExtension on MatchModel {
  bool checkHasUserJoinedMatch({
    required String? playerId,
  }) {
    return joinedParticipants
        .any((participant) => participant.userId == playerId);
  }
}
