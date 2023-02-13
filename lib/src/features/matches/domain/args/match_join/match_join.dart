import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class MatchJoinArgs {
  const MatchJoinArgs({
    required this.authId,
    required this.matchId,
  });

  final String authId;
  final String matchId;
}
