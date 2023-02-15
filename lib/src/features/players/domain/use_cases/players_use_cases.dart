import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';

typedef OnPlayerEvent = void Function(PlayerModel? event);
typedef OnPlayerEventException = void Function(Object e);

abstract class PlayersUseCases {
  void handleCurrentPlayerSubscription({
    required OnPlayerEvent onPlayerEvent,
    required OnPlayerEventException onPlayerEventException,
  });
}
