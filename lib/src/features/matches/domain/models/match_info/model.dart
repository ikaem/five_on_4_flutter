import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/weather/domain/domain.dart';

class MatchInfoModel {
  const MatchInfoModel({
    required this.match,
    required this.weather,
  });

  final MatchModel match;
  final WeatherModel weather;

  factory MatchInfoModel.fromWeatherAndMatchModels({
    required MatchModel match,
    required WeatherModel weather,
  }) {
    return MatchInfoModel(match: match, weather: weather);
  }
}
