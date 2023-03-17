import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class MatchParticipantsInviteArgs {
  const MatchParticipantsInviteArgs({
    required this.participantsArgs,
    required this.matchId,
  });

  final List<MatchParticipantInviteArgs> participantsArgs;
  final String matchId;
}

// TODO move this somewhere
@immutable
class MatchParticipantInviteArgs {
  MatchParticipantInviteArgs({
    required this.playerId,
    required this.nickname,
  });

  final String playerId;
  final String nickname;

  MatchParticipantInviteArgs.fromPlayerModel(PlayerModel model)
      : playerId = model.id,
        nickname = model.nickname;

  Map<String, String> toMap() {
    return {
      'playerId': playerId,
      'nickname': nickname,
    };
  }
}
