import 'dart:async';

import 'package:five_on_4_flutter/src/features/players/data/data_sources/players_remote_data_source/data_source.dart';
import 'package:five_on_4_flutter/src/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/players/data/repositories/repository.dart';
import 'package:five_on_4_flutter/src/features/players/domain/args/player_args.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:rxdart/rxdart.dart';

class PlayersAppRepository implements PlayersRepository {
  PlayersAppRepository({
    required this.playersRemoteDataSource,
  });

  final PlayersRemoteDataSource playersRemoteDataSource;

  final BehaviorSubject<PlayerModel?> _currentPlayerSubject =
      BehaviorSubject<PlayerModel?>();

  StreamSink<PlayerModel?> get _currentPlayerSink => _currentPlayerSubject.sink;
  @override
  Stream<PlayerModel?> get observeCurrentPlayer => _currentPlayerSubject.stream;

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

  @override
  Future<void> loadPlayerbyAuthId(String authId) async {
    final PlayerRemoteDTO playerRemoteDTO =
        await playersRemoteDataSource.getPlayerByAuthId(authId);

    final PlayerModel playerModel = PlayerModel.fromRemoteDTO(playerRemoteDTO);

    _currentPlayerSink.add(playerModel);
  }

  @override
  // TODO no need for this to be async
  Future<void> clearCurrentPlayer() async {
    _currentPlayerSink.add(null);
  }
}
