import 'package:five_on_4_flutter/src/domain/domain.dart'
    show GeoCoordinatesValue, HttpRequestUriValue;
import 'package:five_on_4_flutter/src/features/weather/data/data.dart'
    show WeatherRemoteDTO, WeatherRemoteDataSource;
import 'package:five_on_4_flutter/src/libraries/libraries.dart'
    show HttpWrapper;
import 'package:five_on_4_flutter/src/utils/utils.dart'
    show HttpConstants, ValueFromEnv;
import 'package:flutter/material.dart';

// TODO this should be called app, and not weather api api
@immutable
class WeatherRemoteAppDataSource implements WeatherRemoteDataSource {
  const WeatherRemoteAppDataSource({
    required this.httpWrapper,
  });

  static const String _baseUrl = 'api.weatherapi.com';
  static const String _contextPath = 'v1';
  static const String _currentWeatherPath = 'current.json';

  final HttpWrapper httpWrapper;

  @override
  Future<WeatherRemoteDTO> getWeather(GeoCoordinatesValue coordinates) async {
    final HttpRequestUriValue args = HttpRequestUriValue(
      apiUrlScheme: HttpConstants.httpProtocol,
      apiBaseUrl: _baseUrl,
      apiContextPath: _contextPath,
      apiEndpointPath: _currentWeatherPath,
      queryParameters:
          _generateGetWeatherQueryParameters(coordinates: coordinates),
    );

    final Map<String, dynamic> data =
        await httpWrapper.get<Map<String, dynamic>>(restArgs: args);

    final WeatherRemoteDTO dto = _transformApiResponseToWeatherDTO(data);

    return dto;
  }

  WeatherRemoteDTO _transformApiResponseToWeatherDTO(
    Map<String, dynamic> data,
  ) {
    final WeatherRemoteDTO dto = WeatherRemoteDTO.fromJson(data);

    return dto;
  }

  Map<String, String> _generateGetWeatherQueryParameters({
    required GeoCoordinatesValue coordinates,
  }) {
    final String apiKey = ValueFromEnv.weatherApiKey;

    final Map<String, String> params = {
      'q': '${coordinates.latitude},${coordinates.longitude}',
      'key': apiKey,
    };

    return params;
  }
}
