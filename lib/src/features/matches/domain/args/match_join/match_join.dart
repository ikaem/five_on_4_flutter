import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class MatchJoinArgs {
  const MatchJoinArgs({
    required this.playerId,
    required this.matchId,
  });

  final String playerId;
  final String matchId;
}
