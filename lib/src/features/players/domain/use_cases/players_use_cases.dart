import 'dart:async';

import 'package:five_on_4_flutter/src/features/players/data/repositories/repository.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';

typedef OnPlayerEvent = void Function(PlayerModel? event);
typedef OnPlayerEventException = void Function(Object e);

class PlayersUseCases {
  PlayersUseCases({
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
}
