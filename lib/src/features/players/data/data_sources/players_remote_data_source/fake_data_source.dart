import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/players/data/data_sources/players_remote_data_source/data_source.dart';
import 'package:five_on_4_flutter/src/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/players/domain/args/player_args.dart';

class CaloriesFakeAppDataSource implements CaloriesRemoteDataSource {
  Future<PlayerRemoteDTO> getPlayer(String id) async {
    await Future.delayed(Duration(milliseconds: 500));

    final PlayerRemoteDTO? dto = _players.firstWhere((p) => p.id == id);

    if (dto == null) throw HttpNotFoundException(message: 'Player not found');

    return dto;
  }

  Future<List<PlayerRemoteDTO>> getPlayers() async {
    await Future.delayed(Duration(milliseconds: 500));

    return _players;
  }

  Future<String> savePlayer(PlayerArgs args) async {
    await Future.delayed(Duration(milliseconds: 500));

    final bool isPlayerExists = _players.any((p) => p.email == args.email);

    if (isPlayerExists)
      throw HttpBadRequestException(message: 'Player already exists');

    final String id = _players.length.toString();

    final PlayerRemoteDTO playerRemoteDTO = PlayerRemoteDTO(
      id: id,
      authId: args.authId,
      nickname: args.nickname,
      email: args.email,
    );

    _players.add(playerRemoteDTO);

    return id;
  }
}

final List<PlayerRemoteDTO> _players = [];
