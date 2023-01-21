import 'package:five_on_4_flutter/src/features/matches/data/data.dart';

abstract class MatchesRemoteDataSource {
  Future<MatchRemoteDTO> getMatch(String id);
  Future<List<MatchRemoteDTO>> getMatches();
}
