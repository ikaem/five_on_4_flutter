import 'package:five_on_4_flutter/src/domain/domain.dart'
    show GeoCoordinatesValue;
import 'package:five_on_4_flutter/src/features/weather/domain/models/models.dart'
    show WeatherModel;

abstract class WeatherRepository {
  Future<WeatherModel> getWeather(GeoCoordinatesValue coordinates);
}
