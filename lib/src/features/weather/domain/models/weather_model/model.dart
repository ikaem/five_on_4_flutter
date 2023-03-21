import 'package:five_on_4_flutter/src/features/weather/data/data.dart'
    show WeatherRemoteDTO;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required String locationName,
    required double temperatureCelsius,
    required String weatherDescription,
  }) = _WeatherModel;

  factory WeatherModel.fromRemoteDTO(WeatherRemoteDTO dto) {
    final String locationName = dto.location.name;
    final double temperatureCelsius = dto.current.tempC;
    final String weatherDescription = dto.current.condition.text;

    final WeatherModel model = WeatherModel(
      locationName: locationName,
      temperatureCelsius: temperatureCelsius,
      weatherDescription: weatherDescription,
    );

    return model;
  }
}

// TODO move to extensions
extension WeatherModelExtension on WeatherModel {
  IconData getWeatherIcon() {
    switch (weatherDescription) {
      // TODO make these cosntants
      case 'Light rain':
        {
          return Icons.grain;
        }
      default:
        {
          return Icons.help_outline;
        }
    }
  }

  String getWeatherDescription() {
    switch (weatherDescription) {
      // TODO make these cosntants
      case 'Light rain':
        {
          return 'Light rain';
        }
      default:
        {
          return 'Unknown weather';
        }
    }
  }
}
