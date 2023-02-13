import 'package:five_on_4_flutter/src/features/players/domain/args/player_args.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';

abstract class PlayersRepository {
  Future<String> createPlayer(PlayerArgs args);
  Future<PlayerModel> getPlayer(String id);
  Future<List<PlayerModel>> getPlayers();
}