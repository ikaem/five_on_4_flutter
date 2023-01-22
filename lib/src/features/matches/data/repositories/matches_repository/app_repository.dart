import 'package:five_on_4_flutter/src/features/matches/data/data.dart';
import 'package:five_on_4_flutter/src/features/matches/data/data_sources/data_sources.dart';
import 'package:five_on_4_flutter/src/features/matches/data/repositories/matches_repository/matches_repository.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/models/match/model.dart';

class MatchesAppRepository implements MatchesRepository {
  const MatchesAppRepository({
    required this.matchesRemoteDataSource,
    required this.matchesLocalDataSource,
  });

  final MatchesRemoteDataSource matchesRemoteDataSource;
  final MatchesLocalDataSource matchesLocalDataSource;

  @override
  Future<MatchModel> getMatch(String id) async {
// TODO we should
/* 
- get match 
- update database 
- return the match that we received from remote 

 */

    final MatchRemoteDTO remoteDto = await matchesRemoteDataSource.getMatch(id);

    final MatchLocalDTO localDto = MatchLocalDTO.fromRemoteDto(remoteDto);

// TODO an error could happen here - we should handle it in the database wrapper probably
    await matchesLocalDataSource.upsertMatch(localDto);

    final MatchModel match = MatchModel.fromRemoteDto(remoteDto);

    return match;
  }

  @override
  Future<List<MatchModel>> getMatches() async {
    final List<MatchRemoteDTO> remoteDtos =
        await matchesRemoteDataSource.getMatches();

    final List<MatchLocalDTO> localDtos =
        remoteDtos.map((dto) => MatchLocalDTO.fromRemoteDto(dto)).toList();

    await matchesLocalDataSource.upsertMatches(localDtos);

    final List<MatchModel> matches =
        remoteDtos.map((dto) => MatchModel.fromRemoteDto(dto)).toList();

    return matches;
  }
}
