import 'package:five_on_4_flutter/src/data/repositories/repositories.dart';
import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/weather/data/repositories/repositories.dart';
import 'package:five_on_4_flutter/src/features/weather/domain/domain.dart';

class WeatherUseCases {
  const WeatherUseCases({
    required this.weatherRepository,
    required this.locationRepository,
    // TODO pass some connection repository
    // possibly could get some auth repository too - if needed - not for this one
  });

  final WeatherRepository weatherRepository;
  final LocationRepository locationRepository;

  Future<WeatherModel> getHereAndNowWeather() async {
    // TODO this will throw appropriate errors
    final GeoCoordinatesValue coordinates =
        await locationRepository.getCurrentPosition();

    final WeatherModel weather =
        await weatherRepository.getWeather(coordinates);

    return weather;
  }
}
