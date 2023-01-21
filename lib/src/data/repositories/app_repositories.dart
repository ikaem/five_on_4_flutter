import 'package:five_on_4_flutter/src/data/data_sources/app_data_sources.dart';
import 'package:five_on_4_flutter/src/data/repositories/location_repository/location_repository.dart';
import 'package:five_on_4_flutter/src/features/weather/data/repositories/repositories.dart';

class AppRepositories {
  AppRepositories({
    required this.appDataSources,
  });

  final AppDataSources appDataSources;

  late final WeatherRepository weatherRepository = WeatherAppRepository(
    weatherRemoteDataSource: appDataSources.weatherRemoteDataSource,
  );

  late final LocationRepository locationRepository = LocationAppRepository(
    locationWrapper: appDataSources.locationWrapper,
  );
}
