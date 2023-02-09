import 'package:five_on_4_flutter/src/data/repositories/app_repositories.dart';
import 'package:five_on_4_flutter/src/features/auth/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
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
  );
  late final AuthUseCases authUseCases = AuthUseCases(
    authRepository: appRepositories.authRepository,
  );
}
