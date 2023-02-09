import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';

extension MatchModelExtension on MatchModel {
  bool checkHasUserJoinedMatch(String? userId) {
    return players.any((player) => player == userId);
  }
}
