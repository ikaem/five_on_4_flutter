import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/enums/enums.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class MatchParticipantsInvitationsArgs {
  const MatchParticipantsInvitationsArgs({
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

// TODO move this to extensions
  Map<String, dynamic> toInvitationMap() {
    final DateTime nowDatetime = DateTime.now();

    return {
      'playerId': playerId,
      'nickname': nickname,
      'createdAt': Timestamp.fromDate(nowDatetime),
      'expiresAt': Timestamp.fromDate(nowDatetime.add(Duration(days: 7))),
      'status': MatchParticipantStatus.invited.name,
    };
  }
}
