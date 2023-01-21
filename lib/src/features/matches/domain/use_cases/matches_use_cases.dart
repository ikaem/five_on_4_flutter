import 'package:five_on_4_flutter/src/features/matches/data/repositories/matches_repository/matches_repository.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';

class MatchesUseCases {
  const MatchesUseCases({
    required this.matchesRepository,
  });

  final MatchesRepository matchesRepository;

  // TODO not sure if these should be divided - todays matches, and all matches - this would mean we would have two blocs? but maybe we could have some different stats and such - lets play with it

// TODO this should probably return paginated class of some sort
  Future<List<MatchModel>> getTodaysMatches() async {
/* TODO this probably needs to be formatted to remove time, and just include todays data  */
// TODO will need to use this in future
    final String today = DateTime.now().toIso8601String();
    final String tomorrow =
        DateTime.now().add(const Duration(days: 1)).toIso8601String();

// TODO arguments here would be period i guess - make sure it gets these arguments later
    final List<MatchModel> matches = await matchesRepository.getMatches();

    return matches;
  }
}
