import 'package:five_on_4_flutter/src/features/matches/data/data.dart';

abstract class MatchesLocalDataSource {
  Future<MatchLocalDTO> getMatch(String id);
  Future<int> upsertMatch(MatchLocalDTO dto);
  Future<List<int>> upsertMatches(List<MatchLocalDTO> dtos);
}
