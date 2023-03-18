import 'dart:async';

import 'package:five_on_4_flutter/src/features/players/data/data_sources/players_remote_data_source/data_source.dart';
import 'package:five_on_4_flutter/src/features/players/data/dtos/player_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/players/data/repositories/repository.dart';
import 'package:five_on_4_flutter/src/features/players/domain/args/player_args.dart';
import 'package:five_on_4_flutter/src/features/players/domain/exceptions/exceptions.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:five_on_4_flutter/src/features/players/presentation/blocs/players_get/bloc.dart';
import 'package:rxdart/rxdart.dart';

class PlayersAppRepository implements PlayersRepository {
  PlayersAppRepository({
    required this.playersRemoteDataSource,
  });

  final PlayersRemoteDataSource playersRemoteDataSource;

  final BehaviorSubject<PlayerModel?> _currentPlayerSubject =
      BehaviorSubject.seeded(null);

  StreamSink<PlayerModel?> get _currentPlayerSink => _currentPlayerSubject.sink;

  @override
  Stream<PlayerModel?> get observeCurrentPlayer => _currentPlayerSubject.stream;
  @override
  Future<PlayerModel?> get currentPlayer => _currentPlayerSubject.first;

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

  // TODo TEST
  @override
  void setCurrentPlayer(PlayerModel? playerModel) {
    // TODO not sure about this
    if (playerModel == null) {
      _currentPlayerSink.addError(
          PlayerNotFoundException(message: 'Current player not found'));
      return;
    }

    _currentPlayerSink.add(playerModel);
  }

  Future<List<PlayerModel>> getPlayers() async {
    final List<PlayerRemoteDTO> playerRemoteDTOs =
        await playersRemoteDataSource.getPlayers();

    final List<PlayerModel> players =
        playerRemoteDTOs.map((p) => PlayerModel.fromRemoteDTO(p)).toList();

    return players;
  }

  // @override
  // Future<void> loadPlayerbyAuthId(String authId) async {
  //   final PlayerRemoteDTO playerRemoteDTO =
  //       await playersRemoteDataSource.getPlayerByAuthId(authId);

  //   final PlayerModel playerModel = PlayerModel.fromRemoteDTO(playerRemoteDTO);

  //   _currentPlayerSink.add(playerModel);
  // }

  @override
  // TODO no need for this to be async
  // TODO this needs to be called on logout as well as part of clear initial data
  Future<void> clearCurrentPlayer() async {
    // TODO this will probably turn into loo
    _currentPlayerSink.add(null);
  }

  @override
  Stream<List<PlayerModel>> searchPlayersStream(
      PlayersGetSearchFilters filters) async* {
    final String? currentPlayerId = _currentPlayerSubject.value?.id;

    final List<PlayerRemoteDTO> results =
        await playersRemoteDataSource.searchPlayers(
      filters,
      currentPlayerId,
    );

    final List<PlayerModel> players =
        results.map(PlayerModel.fromRemoteDTO).toList();

    yield players;
  }
}
