import 'package:five_on_4_flutter/src/data/repositories/app_repositories.dart';
import 'package:five_on_4_flutter/src/domain/use_cases/initial_data/app_use_cases.dart';
import 'package:five_on_4_flutter/src/domain/use_cases/initial_data/use_cases.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/players/domain/use_cases/app_players_use_cases.dart';
import 'package:five_on_4_flutter/src/features/players/domain/use_cases/players_use_cases.dart';
import 'package:five_on_4_flutter/src/features/weather/domain/domain.dart';

class AppUseCases {
  AppUseCases({
    required this.appRepositories,
  });

  final AppRepositories appRepositories;

  late final WeatherUseCases weatherUseCases = WeatherUseCases(
    weatherRepository: appRepositories.weatherRepository,
    locationRepository: appRepositories.locationRepository,
  );
  late final MatchesUseCases matchesUseCases = MatchesUseCases(
    matchesRepository: appRepositories.matchesRepository,
    authRepository: appRepositories.authRepository,
    playersRepository: appRepositories.playersRepository,
    locationRepository: appRepositories.locationRepository,
    weatherRepository: appRepositories.weatherRepository,
  );
  late final AuthUseCases authUseCases = AuthUseCases(
    authRepository: appRepositories.authRepository,
    // playersRepository: appRepositories.playersRepository,
  );

  late final PlayersUseCases playersUseCases =
      PlayersAppUseCases(playersRepository: appRepositories.playersRepository);

  late final InitialDataUseCases initialDataUseCases = InitialDataAppUseCases(
    authRepository: appRepositories.authRepository,
    playersRepository: appRepositories.playersRepository,
  );
}
