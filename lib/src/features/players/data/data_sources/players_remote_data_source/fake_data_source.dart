import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/players/data/data_sources/players_remote_data_source/data_source.dart';
import 'package:five_on_4_flutter/src/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/players/domain/args/player_args.dart';

class PlayersFakeDataSource implements PlayersRemoteDataSource {
  Future<PlayerRemoteDTO> getPlayer(String id) async {
    await Future.delayed(Duration(milliseconds: 500));

    final PlayerRemoteDTO? dto = players.firstWhere((p) => p.id == id);

    if (dto == null) throw HttpNotFoundException(message: 'Player not found');

    return dto;
  }

  Future<List<PlayerRemoteDTO>> getPlayers() async {
    await Future.delayed(Duration(milliseconds: 500));

    return players;
  }

  Future<String> createPlayer(PlayerArgs args) async {
    await Future.delayed(Duration(milliseconds: 500));

    final bool isPlayerExists = players.any((p) => p.email == args.email);

    if (isPlayerExists)
      throw HttpBadRequestException(message: 'Player already exists');

    final String id = players.length.toString();

    final PlayerRemoteDTO playerRemoteDTO = PlayerRemoteDTO(
      id: id,
      authId: args.authId,
      nickname: args.nickname,
      email: args.email,
    );

    players.add(playerRemoteDTO);

    return id;
  }

  @override
  Future<PlayerRemoteDTO> getPlayerByAuthId(String authId) async {
    await Future.delayed(Duration(milliseconds: 500));

    final PlayerRemoteDTO? dto = players.firstWhere((p) => p.authId == authId);

    if (dto == null)
      throw HttpNotFoundException(message: 'Player by authId not found');

    return dto;
  }
}

final List<PlayerRemoteDTO> players = [];
