import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class MatchJoinArgs {
  const MatchJoinArgs({
    required this.playerId,
    required this.playerNickname,
    required this.matchId,
  });

  final String playerId;
  final String playerNickname;
  final String matchId;
}
