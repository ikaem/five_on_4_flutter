import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:five_on_4_flutter/src/features/players/presentation/blocs/players_get/bloc.dart';

typedef OnPlayerEvent = void Function(PlayerModel? event);
typedef OnPlayerEventException = void Function(Object e);

abstract class PlayersUseCases {
  Stream<List<PlayerModel>> onSearchPlayers(PlayersGetSearchFilters filters);
  void handleCurrentPlayerSubscription({
    required OnPlayerEvent onPlayerEvent,
    required OnPlayerEventException onPlayerEventException,
  });
}
