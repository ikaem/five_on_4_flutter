import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/values/new_match/value.dart';

abstract class MatchesRepository {
  Future<MatchModel> getMatch(String id);
  // TODO - eventually, return pagianted matches, and also provide time span arguments, and all other arguments
  Future<List<MatchModel>> getMatches();
  Future<String> createMatch(NewMatchValue newMatch);
  Future<void> joinMatch(MatchJoinArgs matchJoinArgs);
  Future<void> unjoinMatch(MatchJoinArgs matchJoinArgs);
}
