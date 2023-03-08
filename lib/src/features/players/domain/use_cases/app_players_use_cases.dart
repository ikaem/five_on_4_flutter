import 'dart:async';

import 'package:five_on_4_flutter/src/features/players/data/repositories/repository.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:five_on_4_flutter/src/features/players/domain/use_cases/players_use_cases.dart';
import 'package:five_on_4_flutter/src/features/players/presentation/blocs/players_get/bloc.dart';

class PlayersAppUseCases implements PlayersUseCases {
  PlayersAppUseCases({
    required this.playersRepository,
  });

  final PlayersRepository playersRepository;
  // TODO note that this is late, and that it should not be reset
  late final StreamSubscription<PlayerModel?>? _currentUserSubscription;

// TODO not sure if this is a good practice
  // late final StreamSubscription<PlayerModel?> _currentPlayerSubscription =
  //     playersRepository.observeCurrentPlayer.listen((event) => event);

  void handleCurrentPlayerSubscription({
    required OnPlayerEvent onPlayerEvent,
    required OnPlayerEventException onPlayerEventException,
  }) {
// TODO this might be a bit better
    _currentUserSubscription = playersRepository.observeCurrentPlayer.listen(
      onPlayerEvent,
      onError: onPlayerEventException,
    );

    // _currentPlayerSubscription.onData(onAuthEvent);
    // _currentPlayerSubscription.onError(onAuthEventException);
  }

// TODO test
  @override
  Stream<List<PlayerModel>> onSearchPlayers(PlayersGetSearchFilters filters) {
    final stream = playersRepository.searchPlayersStream(filters);

    return stream;
  }
  // Stream<List<PlayerModel>> onSearchPlayers(PlayersGetSearchFilters) async* {
  //   final PlayerModel player1 = PlayerModel(
  //     id: '1',
  //     nickname: 'nickname',
  //     email: 'email',
  //   );
  //   final PlayerModel player2 = PlayerModel(
  //     id: '2',
  //     nickname: 'nickname',
  //     email: 'email',
  //   );
  //   final PlayerModel player3 = PlayerModel(
  //     id: '3',
  //     nickname: 'nickname',
  //     email: 'email',
  //   );

  //   yield [
  //     player1,
  //     player2,
  //     player3,
  //   ];
  // }
}
