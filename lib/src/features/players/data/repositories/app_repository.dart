import 'package:five_on_4_flutter/src/features/players/data/data_sources/players_remote_data_source/data_source.dart';
import 'package:five_on_4_flutter/src/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/players/data/repositories/repository.dart';
import 'package:five_on_4_flutter/src/features/players/domain/args/player_args.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';

class PlayersAppRepository implements PlayersRepository {
  const PlayersAppRepository({
    required this.playersRemoteDataSource,
  });

  final PlayersRemoteDataSource playersRemoteDataSource;

  Future<String> createPlayer(PlayerArgs args) async {
    final String id = await playersRemoteDataSource.createPlayer(args);

    return id;
  }

  Future<PlayerModel> getPlayer(String id) async {
    final PlayerRemoteDTO playerRemoteDTO =
        await playersRemoteDataSource.getPlayer(id);

    final PlayerModel player = PlayerModel.fromRemoteDTO(playerRemoteDTO);

    return player;
  }

  Future<List<PlayerModel>> getPlayers() async {
    final List<PlayerRemoteDTO> playerRemoteDTOs =
        await playersRemoteDataSource.getPlayers();

    final List<PlayerModel> players =
        playerRemoteDTOs.map((p) => PlayerModel.fromRemoteDTO(p)).toList();

    return players;
  }
}
