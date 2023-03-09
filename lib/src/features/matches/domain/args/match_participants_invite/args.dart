import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class MatchParticipantsInviteArgs {
  const MatchParticipantsInviteArgs({
    required this.playersIds,
    required this.matchId,
  });

  final List<String> playersIds;
  final String matchId;
}
