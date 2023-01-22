import 'package:five_on_4_flutter/src/features/matches/data/data_sources/data_sources.dart';
import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_local/dto.dart';
import 'package:five_on_4_flutter/src/libraries/isar/app_database.dart';
import 'package:five_on_4_flutter/src/utils/helpers/fast_hash.dart';

class MatchesLocalAppDataSource implements MatchesLocalDataSource {
  const MatchesLocalAppDataSource({
    required this.appDatabase,
  });

  final AppDatabase appDatabase;

  @override
  Future<MatchLocalDTO> getMatch(String id) async {
    final int dbId = fastHash(id);
    final MatchLocalDTO dto = await appDatabase.getItem<MatchLocalDTO>(dbId);

    return dto;
  }

  @override
  Future<int> upsertMatch(MatchLocalDTO dto) async {
    // TODO test
    final int id = await appDatabase.insertItem<MatchLocalDTO>(dto);

    return id;
  }

  @override
  Future<List<int>> upsertMatches(List<MatchLocalDTO> dtos) async {
    // TODO test
    final List<int> ids = await appDatabase.insertItems<MatchLocalDTO>(dtos);

    return ids;
  }
}
