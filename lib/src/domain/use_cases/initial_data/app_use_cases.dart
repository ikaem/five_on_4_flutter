import 'package:five_on_4_flutter/src/domain/use_cases/initial_data/use_cases.dart';
import 'package:five_on_4_flutter/src/domain/values/initial_data/value.dart';
import 'package:five_on_4_flutter/src/features/auth/auth.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/models/auth/auth.dart';
import 'package:five_on_4_flutter/src/features/players/data/repositories/repository.dart';
import 'package:five_on_4_flutter/src/features/players/domain/models/player/model.dart';
import 'package:rxdart/rxdart.dart';

class InitialDataAppUseCases implements InitialDataUseCases {
  const InitialDataAppUseCases({
    required AuthRepository authRepository,
    required PlayersRepository playersRepository,
  })  : _authRepository = authRepository,
        _playersRepository = playersRepository;

  final AuthRepository _authRepository;
  final PlayersRepository _playersRepository;

  @override
  // Stream<InitialDataValue> get initialDataStream => _playersRepository.ob

  Stream<InitialDataValue> get initialDataStream {
    final Stream<InitialDataValue> stream = Rx.combineLatest2(
      _authRepository.observeAuth,
      _playersRepository.observeCurrentPlayer,
      (a, b) {
        return InitialDataValue(
          auth: a,
          currentPlayer: b,
        );
      },
    );

    return stream;
  }

  @override
  Stream<AuthModel?> get authStream => _authRepository.observeAuth;
  @override
  Stream<PlayerModel?> get currentPlayerStream =>
      _playersRepository.observeCurrentPlayer;

  @override
  Future<void> onAuthCheckOnAppStart() async {
    await _authRepository.checkAuth();
//     if (authId == null) return;

// // careful here for double fetch - if we
    // await _playersRepository.loadPlayerbyAuthId(authId);
  }

  @override
  Future<void> initialDataClear() async {
    // TODO this should be used instead of logout
    await _authRepository.logout();
    await _playersRepository.clearCurrentPlayer();
    // this needs to
    // auth repository logout
    // player repository clear current player
    // possibly clear some other initialy data
  }

  @override
  Future<void> onLoadCurrentPlayer(String authId) async {
    // await _playersRepository.loadPlayerbyAuthId(authId);
    await _playersRepository.getPlayer(authId);
  }
}
