import 'package:five_on_4_flutter/src/domain/domain.dart'
    show GeoCoordinatesValue;
import 'package:five_on_4_flutter/src/features/weather/data/data.dart'
    show WeatherRemoteDTO;

abstract class WeatherRemoteDataSource {
  Future<WeatherRemoteDTO> getWeather(GeoCoordinatesValue coordinates);
}
