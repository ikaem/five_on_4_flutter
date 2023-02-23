import 'package:five_on_4_flutter/src/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/players/domain/args/player_args.dart';

abstract class PlayersRemoteDataSource {
  Future<PlayerRemoteDTO> getPlayer(String id);
  // Future<PlayerRemoteDTO> getPlayerByAuthId(String authId);
  Future<List<PlayerRemoteDTO>> getPlayers();
  Future<String> createPlayer(PlayerArgs args);
}
