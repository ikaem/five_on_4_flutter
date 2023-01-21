import 'package:five_on_4_flutter/src/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/weather/data/data.dart';
import 'package:five_on_4_flutter/src/features/weather/data/repositories/repositories.dart';
import 'package:five_on_4_flutter/src/features/weather/domain/models/models.dart';

// TODO import all properly thorfugh barrels

class WeatherAppRepository implements WeatherRepository {
  const WeatherAppRepository({
    required this.weatherRemoteDataSource,
  });

  final WeatherRemoteDataSource weatherRemoteDataSource;

  @override
  Future<WeatherModel> getWeather(GeoCoordinatesValue coordinates) async {
    final WeatherRemoteDTO dto =
        await weatherRemoteDataSource.getWeather(coordinates);

    final WeatherModel model = _transformDTOtoWeatherModel(dto);

    return model;
  }

  WeatherModel _transformDTOtoWeatherModel(WeatherRemoteDTO dto) {
    final WeatherModel model = WeatherModel.fromRemoteDTO(dto);

    return model;
  }
}
