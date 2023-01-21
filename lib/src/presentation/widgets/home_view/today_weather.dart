import 'package:five_on_4_flutter/src/features/weather/domain/domain.dart';
import 'package:flutter/material.dart';

class TodayWeather extends StatelessWidget {
  const TodayWeather({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Icon(Icons.sunny),
        Text(weather.weatherDescription),
      ],
    );
  }
}
