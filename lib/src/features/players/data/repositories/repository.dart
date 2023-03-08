import 'package:five_on_4_flutter/src/features/players/domain/args/player_args.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:five_on_4_flutter/src/features/players/presentation/blocs/players_get/bloc.dart';

abstract class PlayersRepository {
  Future<String> createPlayer(PlayerArgs args);
  Future<PlayerModel> getPlayer(String id);
  Future<List<PlayerModel>> getPlayers();
  // Future<void> loadPlayerbyAuthId(String authId);
  Future<void> clearCurrentPlayer();
  Stream<PlayerModel?> get observeCurrentPlayer;
  Future<PlayerModel?> get currentPlayer;
  Stream<List<PlayerModel>> searchPlayersStream(
      PlayersGetSearchFilters filters);
  void setCurrentPlayer(PlayerModel? playerModel);
}
