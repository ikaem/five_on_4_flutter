import 'package:five_on_4_flutter/src/features/matches/data/data.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/values/new_match/value.dart';

abstract class MatchesRemoteDataSource {
  Future<MatchRemoteDTO> getMatch(String id);
  Future<List<MatchRemoteDTO>> getMatches();
  Future<String> createMatch(NewMatchValue newMatch);
}
