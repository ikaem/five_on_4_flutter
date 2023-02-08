import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class MatchJoinArgs {
  const MatchJoinArgs({
    required this.userId,
    required this.matchId,
  });

  final String userId;
  final String matchId;
}
