abstract class ValueFromEnv {
  static const _envVarWeatherApiKey = 'weather-api-key';

  static String get weatherApiKey =>
      const String.fromEnvironment(_envVarWeatherApiKey);
}
