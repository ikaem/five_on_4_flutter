// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherRemoteDTO _$$_WeatherRemoteDTOFromJson(Map<String, dynamic> json) =>
    _$_WeatherRemoteDTO(
      location: WeatherLocationRemoteDTO.fromJson(
          json['location'] as Map<String, dynamic>),
      current: WeatherCurrentRemoteDTO.fromJson(
          json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WeatherRemoteDTOToJson(_$_WeatherRemoteDTO instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };

_$_WeatherLocationRemoteDTO _$$_WeatherLocationRemoteDTOFromJson(
        Map<String, dynamic> json) =>
    _$_WeatherLocationRemoteDTO(
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      tzId: json['tz_id'] as String,
      localTimeEpoch: json['localtime_epoch'] as int,
      localTime: json['localtime'] as String,
    );

Map<String, dynamic> _$$_WeatherLocationRemoteDTOToJson(
        _$_WeatherLocationRemoteDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'tz_id': instance.tzId,
      'localtime_epoch': instance.localTimeEpoch,
      'localtime': instance.localTime,
    };

_$_WeatherCurrentRemoteDTO _$$_WeatherCurrentRemoteDTOFromJson(
        Map<String, dynamic> json) =>
    _$_WeatherCurrentRemoteDTO(
      lastUpdatedEpoch: json['last_updated_epoch'] as int,
      lastUpdated: json['last_updated'] as String,
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      isDay: json['is_day'] as int,
      condition: WeatherCurrentConditionRemoteDTO.fromJson(
          json['condition'] as Map<String, dynamic>),
      windMph: (json['wind_mph'] as num).toDouble(),
      windKph: (json['wind_kph'] as num).toDouble(),
      windDegree: json['wind_degree'] as int,
      windDire: json['wind_dir'] as String,
      pressureMb: (json['pressure_mb'] as num).toDouble(),
      pressureIn: (json['pressure_in'] as num).toDouble(),
      precipMm: (json['precip_mm'] as num).toDouble(),
      precipIn: (json['precip_in'] as num).toDouble(),
      humidity: json['humidity'] as int,
      cloud: json['cloud'] as int,
      feelsLikeC: (json['feelslike_c'] as num).toDouble(),
      feelsLike: (json['feelslike_f'] as num).toDouble(),
      visKm: (json['vis_km'] as num).toDouble(),
      visMiles: (json['vis_miles'] as num).toDouble(),
      uv: (json['uv'] as num).toDouble(),
      gustMph: (json['gust_mph'] as num).toDouble(),
      gustKph: (json['gust_kph'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WeatherCurrentRemoteDTOToJson(
        _$_WeatherCurrentRemoteDTO instance) =>
    <String, dynamic>{
      'last_updated_epoch': instance.lastUpdatedEpoch,
      'last_updated': instance.lastUpdated,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
      'wind_degree': instance.windDegree,
      'wind_dir': instance.windDire,
      'pressure_mb': instance.pressureMb,
      'pressure_in': instance.pressureIn,
      'precip_mm': instance.precipMm,
      'precip_in': instance.precipIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelsLikeC,
      'feelslike_f': instance.feelsLike,
      'vis_km': instance.visKm,
      'vis_miles': instance.visMiles,
      'uv': instance.uv,
      'gust_mph': instance.gustMph,
      'gust_kph': instance.gustKph,
    };

_$_WeatherCurrentConditionRemoteDTO
    _$$_WeatherCurrentConditionRemoteDTOFromJson(Map<String, dynamic> json) =>
        _$_WeatherCurrentConditionRemoteDTO(
          text: json['text'] as String,
          icon: json['icon'] as String,
          code: json['code'] as int,
        );

Map<String, dynamic> _$$_WeatherCurrentConditionRemoteDTOToJson(
        _$_WeatherCurrentConditionRemoteDTO instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };
