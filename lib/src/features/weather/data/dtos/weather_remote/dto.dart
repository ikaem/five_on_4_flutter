import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';
part 'dto.g.dart';

@freezed
class WeatherRemoteDTO with _$WeatherRemoteDTO {
  const factory WeatherRemoteDTO({
    required WeatherLocationRemoteDTO location,
    required WeatherCurrentRemoteDTO current,
  }) = _WeatherRemoteDTO;

  factory WeatherRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherRemoteDTOFromJson(json);
}

@freezed
class WeatherLocationRemoteDTO with _$WeatherLocationRemoteDTO {
  const factory WeatherLocationRemoteDTO({
    required String name,
    required String region,
    required String country,
    required double lat,
    required double lon,
    @JsonKey(name: 'tz_id') required String tzId,
    @JsonKey(name: 'localtime_epoch') required int localTimeEpoch,
    @JsonKey(name: 'localtime') required String localTime,
  }) = _WeatherLocationRemoteDTO;

  factory WeatherLocationRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherLocationRemoteDTOFromJson(json);
}

@freezed
class WeatherCurrentRemoteDTO with _$WeatherCurrentRemoteDTO {
  const factory WeatherCurrentRemoteDTO({
    @JsonKey(name: 'last_updated_epoch') required int lastUpdatedEpoch,
    @JsonKey(name: 'last_updated') required String lastUpdated,
    @JsonKey(name: 'temp_c') required double tempC,
    @JsonKey(name: 'temp_f') required double tempF,
    // TODO probably maps to boolean
    @JsonKey(name: 'is_day') required int isDay,
    // TODO add condition here
    required WeatherCurrentConditionRemoteDTO condition,
    @JsonKey(name: 'wind_mph') required double windMph,
    @JsonKey(name: 'wind_kph') required double windKph,
    @JsonKey(name: 'wind_degree') required int windDegree,
    @JsonKey(name: 'wind_dir') required String windDire,
    @JsonKey(name: 'pressure_mb') required double pressureMb,
    @JsonKey(name: 'pressure_in') required double pressureIn,
    @JsonKey(name: 'precip_mm') required double precipMm,
    @JsonKey(name: 'precip_in') required double precipIn,
    required int humidity,
    required int cloud,
    @JsonKey(name: 'feelslike_c') required double feelsLikeC,
    @JsonKey(name: 'feelslike_f') required double feelsLike,
    @JsonKey(name: 'vis_km') required double visKm,
    @JsonKey(name: 'vis_miles') required double visMiles,
    required double uv,
    @JsonKey(name: 'gust_mph') required double gustMph,
    @JsonKey(name: 'gust_kph') required double gustKph,
  }) = _WeatherCurrentRemoteDTO;

  factory WeatherCurrentRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherCurrentRemoteDTOFromJson(json);
}

@freezed
class WeatherCurrentConditionRemoteDTO with _$WeatherCurrentConditionRemoteDTO {
  const factory WeatherCurrentConditionRemoteDTO({
    required String text,
    required String icon,
    required int code,
  }) = _WeatherCurrentConditionRemoteDTO;

  factory WeatherCurrentConditionRemoteDTO.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$WeatherCurrentConditionRemoteDTOFromJson(json);
}
