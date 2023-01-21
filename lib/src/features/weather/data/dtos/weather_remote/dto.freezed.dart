// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherRemoteDTO _$WeatherRemoteDTOFromJson(Map<String, dynamic> json) {
  return _WeatherRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$WeatherRemoteDTO {
  WeatherLocationRemoteDTO get location => throw _privateConstructorUsedError;
  WeatherCurrentRemoteDTO get current => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherRemoteDTOCopyWith<WeatherRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherRemoteDTOCopyWith<$Res> {
  factory $WeatherRemoteDTOCopyWith(
          WeatherRemoteDTO value, $Res Function(WeatherRemoteDTO) then) =
      _$WeatherRemoteDTOCopyWithImpl<$Res, WeatherRemoteDTO>;
  @useResult
  $Res call(
      {WeatherLocationRemoteDTO location, WeatherCurrentRemoteDTO current});

  $WeatherLocationRemoteDTOCopyWith<$Res> get location;
  $WeatherCurrentRemoteDTOCopyWith<$Res> get current;
}

/// @nodoc
class _$WeatherRemoteDTOCopyWithImpl<$Res, $Val extends WeatherRemoteDTO>
    implements $WeatherRemoteDTOCopyWith<$Res> {
  _$WeatherRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? current = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as WeatherLocationRemoteDTO,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as WeatherCurrentRemoteDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherLocationRemoteDTOCopyWith<$Res> get location {
    return $WeatherLocationRemoteDTOCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherCurrentRemoteDTOCopyWith<$Res> get current {
    return $WeatherCurrentRemoteDTOCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherRemoteDTOCopyWith<$Res>
    implements $WeatherRemoteDTOCopyWith<$Res> {
  factory _$$_WeatherRemoteDTOCopyWith(
          _$_WeatherRemoteDTO value, $Res Function(_$_WeatherRemoteDTO) then) =
      __$$_WeatherRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherLocationRemoteDTO location, WeatherCurrentRemoteDTO current});

  @override
  $WeatherLocationRemoteDTOCopyWith<$Res> get location;
  @override
  $WeatherCurrentRemoteDTOCopyWith<$Res> get current;
}

/// @nodoc
class __$$_WeatherRemoteDTOCopyWithImpl<$Res>
    extends _$WeatherRemoteDTOCopyWithImpl<$Res, _$_WeatherRemoteDTO>
    implements _$$_WeatherRemoteDTOCopyWith<$Res> {
  __$$_WeatherRemoteDTOCopyWithImpl(
      _$_WeatherRemoteDTO _value, $Res Function(_$_WeatherRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? current = null,
  }) {
    return _then(_$_WeatherRemoteDTO(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as WeatherLocationRemoteDTO,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as WeatherCurrentRemoteDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherRemoteDTO implements _WeatherRemoteDTO {
  const _$_WeatherRemoteDTO({required this.location, required this.current});

  factory _$_WeatherRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherRemoteDTOFromJson(json);

  @override
  final WeatherLocationRemoteDTO location;
  @override
  final WeatherCurrentRemoteDTO current;

  @override
  String toString() {
    return 'WeatherRemoteDTO(location: $location, current: $current)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherRemoteDTO &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.current, current) || other.current == current));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, location, current);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherRemoteDTOCopyWith<_$_WeatherRemoteDTO> get copyWith =>
      __$$_WeatherRemoteDTOCopyWithImpl<_$_WeatherRemoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherRemoteDTOToJson(
      this,
    );
  }
}

abstract class _WeatherRemoteDTO implements WeatherRemoteDTO {
  const factory _WeatherRemoteDTO(
      {required final WeatherLocationRemoteDTO location,
      required final WeatherCurrentRemoteDTO current}) = _$_WeatherRemoteDTO;

  factory _WeatherRemoteDTO.fromJson(Map<String, dynamic> json) =
      _$_WeatherRemoteDTO.fromJson;

  @override
  WeatherLocationRemoteDTO get location;
  @override
  WeatherCurrentRemoteDTO get current;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherRemoteDTOCopyWith<_$_WeatherRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherLocationRemoteDTO _$WeatherLocationRemoteDTOFromJson(
    Map<String, dynamic> json) {
  return _WeatherLocationRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$WeatherLocationRemoteDTO {
  String get name => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  @JsonKey(name: 'tz_id')
  String get tzId => throw _privateConstructorUsedError;
  @JsonKey(name: 'localtime_epoch')
  int get localTimeEpoch => throw _privateConstructorUsedError;
  @JsonKey(name: 'localtime')
  String get localTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherLocationRemoteDTOCopyWith<WeatherLocationRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherLocationRemoteDTOCopyWith<$Res> {
  factory $WeatherLocationRemoteDTOCopyWith(WeatherLocationRemoteDTO value,
          $Res Function(WeatherLocationRemoteDTO) then) =
      _$WeatherLocationRemoteDTOCopyWithImpl<$Res, WeatherLocationRemoteDTO>;
  @useResult
  $Res call(
      {String name,
      String region,
      String country,
      double lat,
      double lon,
      @JsonKey(name: 'tz_id') String tzId,
      @JsonKey(name: 'localtime_epoch') int localTimeEpoch,
      @JsonKey(name: 'localtime') String localTime});
}

/// @nodoc
class _$WeatherLocationRemoteDTOCopyWithImpl<$Res,
        $Val extends WeatherLocationRemoteDTO>
    implements $WeatherLocationRemoteDTOCopyWith<$Res> {
  _$WeatherLocationRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? region = null,
    Object? country = null,
    Object? lat = null,
    Object? lon = null,
    Object? tzId = null,
    Object? localTimeEpoch = null,
    Object? localTime = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      tzId: null == tzId
          ? _value.tzId
          : tzId // ignore: cast_nullable_to_non_nullable
              as String,
      localTimeEpoch: null == localTimeEpoch
          ? _value.localTimeEpoch
          : localTimeEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      localTime: null == localTime
          ? _value.localTime
          : localTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherLocationRemoteDTOCopyWith<$Res>
    implements $WeatherLocationRemoteDTOCopyWith<$Res> {
  factory _$$_WeatherLocationRemoteDTOCopyWith(
          _$_WeatherLocationRemoteDTO value,
          $Res Function(_$_WeatherLocationRemoteDTO) then) =
      __$$_WeatherLocationRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String region,
      String country,
      double lat,
      double lon,
      @JsonKey(name: 'tz_id') String tzId,
      @JsonKey(name: 'localtime_epoch') int localTimeEpoch,
      @JsonKey(name: 'localtime') String localTime});
}

/// @nodoc
class __$$_WeatherLocationRemoteDTOCopyWithImpl<$Res>
    extends _$WeatherLocationRemoteDTOCopyWithImpl<$Res,
        _$_WeatherLocationRemoteDTO>
    implements _$$_WeatherLocationRemoteDTOCopyWith<$Res> {
  __$$_WeatherLocationRemoteDTOCopyWithImpl(_$_WeatherLocationRemoteDTO _value,
      $Res Function(_$_WeatherLocationRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? region = null,
    Object? country = null,
    Object? lat = null,
    Object? lon = null,
    Object? tzId = null,
    Object? localTimeEpoch = null,
    Object? localTime = null,
  }) {
    return _then(_$_WeatherLocationRemoteDTO(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      tzId: null == tzId
          ? _value.tzId
          : tzId // ignore: cast_nullable_to_non_nullable
              as String,
      localTimeEpoch: null == localTimeEpoch
          ? _value.localTimeEpoch
          : localTimeEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      localTime: null == localTime
          ? _value.localTime
          : localTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherLocationRemoteDTO implements _WeatherLocationRemoteDTO {
  const _$_WeatherLocationRemoteDTO(
      {required this.name,
      required this.region,
      required this.country,
      required this.lat,
      required this.lon,
      @JsonKey(name: 'tz_id') required this.tzId,
      @JsonKey(name: 'localtime_epoch') required this.localTimeEpoch,
      @JsonKey(name: 'localtime') required this.localTime});

  factory _$_WeatherLocationRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherLocationRemoteDTOFromJson(json);

  @override
  final String name;
  @override
  final String region;
  @override
  final String country;
  @override
  final double lat;
  @override
  final double lon;
  @override
  @JsonKey(name: 'tz_id')
  final String tzId;
  @override
  @JsonKey(name: 'localtime_epoch')
  final int localTimeEpoch;
  @override
  @JsonKey(name: 'localtime')
  final String localTime;

  @override
  String toString() {
    return 'WeatherLocationRemoteDTO(name: $name, region: $region, country: $country, lat: $lat, lon: $lon, tzId: $tzId, localTimeEpoch: $localTimeEpoch, localTime: $localTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherLocationRemoteDTO &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.tzId, tzId) || other.tzId == tzId) &&
            (identical(other.localTimeEpoch, localTimeEpoch) ||
                other.localTimeEpoch == localTimeEpoch) &&
            (identical(other.localTime, localTime) ||
                other.localTime == localTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, region, country, lat, lon,
      tzId, localTimeEpoch, localTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherLocationRemoteDTOCopyWith<_$_WeatherLocationRemoteDTO>
      get copyWith => __$$_WeatherLocationRemoteDTOCopyWithImpl<
          _$_WeatherLocationRemoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherLocationRemoteDTOToJson(
      this,
    );
  }
}

abstract class _WeatherLocationRemoteDTO implements WeatherLocationRemoteDTO {
  const factory _WeatherLocationRemoteDTO(
          {required final String name,
          required final String region,
          required final String country,
          required final double lat,
          required final double lon,
          @JsonKey(name: 'tz_id') required final String tzId,
          @JsonKey(name: 'localtime_epoch') required final int localTimeEpoch,
          @JsonKey(name: 'localtime') required final String localTime}) =
      _$_WeatherLocationRemoteDTO;

  factory _WeatherLocationRemoteDTO.fromJson(Map<String, dynamic> json) =
      _$_WeatherLocationRemoteDTO.fromJson;

  @override
  String get name;
  @override
  String get region;
  @override
  String get country;
  @override
  double get lat;
  @override
  double get lon;
  @override
  @JsonKey(name: 'tz_id')
  String get tzId;
  @override
  @JsonKey(name: 'localtime_epoch')
  int get localTimeEpoch;
  @override
  @JsonKey(name: 'localtime')
  String get localTime;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherLocationRemoteDTOCopyWith<_$_WeatherLocationRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}

WeatherCurrentRemoteDTO _$WeatherCurrentRemoteDTOFromJson(
    Map<String, dynamic> json) {
  return _WeatherCurrentRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$WeatherCurrentRemoteDTO {
  @JsonKey(name: 'last_updated_epoch')
  int get lastUpdatedEpoch => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated')
  String get lastUpdated => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp_c')
  double get tempC => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp_f')
  double get tempF =>
      throw _privateConstructorUsedError; // TODO probably maps to boolean
  @JsonKey(name: 'is_day')
  int get isDay =>
      throw _privateConstructorUsedError; // TODO add condition here
  WeatherCurrentConditionRemoteDTO get condition =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_mph')
  double get windMph => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_kph')
  double get windKph => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_degree')
  int get windDegree => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_dir')
  String get windDire => throw _privateConstructorUsedError;
  @JsonKey(name: 'pressure_mb')
  double get pressureMb => throw _privateConstructorUsedError;
  @JsonKey(name: 'pressure_in')
  double get pressureIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'precip_mm')
  double get precipMm => throw _privateConstructorUsedError;
  @JsonKey(name: 'precip_in')
  double get precipIn => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  int get cloud => throw _privateConstructorUsedError;
  @JsonKey(name: 'feelslike_c')
  double get feelsLikeC => throw _privateConstructorUsedError;
  @JsonKey(name: 'feelslike_f')
  double get feelsLike => throw _privateConstructorUsedError;
  @JsonKey(name: 'vis_km')
  double get visKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'vis_miles')
  double get visMiles => throw _privateConstructorUsedError;
  double get uv => throw _privateConstructorUsedError;
  @JsonKey(name: 'gust_mph')
  double get gustMph => throw _privateConstructorUsedError;
  @JsonKey(name: 'gust_kph')
  double get gustKph => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCurrentRemoteDTOCopyWith<WeatherCurrentRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCurrentRemoteDTOCopyWith<$Res> {
  factory $WeatherCurrentRemoteDTOCopyWith(WeatherCurrentRemoteDTO value,
          $Res Function(WeatherCurrentRemoteDTO) then) =
      _$WeatherCurrentRemoteDTOCopyWithImpl<$Res, WeatherCurrentRemoteDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'last_updated_epoch') int lastUpdatedEpoch,
      @JsonKey(name: 'last_updated') String lastUpdated,
      @JsonKey(name: 'temp_c') double tempC,
      @JsonKey(name: 'temp_f') double tempF,
      @JsonKey(name: 'is_day') int isDay,
      WeatherCurrentConditionRemoteDTO condition,
      @JsonKey(name: 'wind_mph') double windMph,
      @JsonKey(name: 'wind_kph') double windKph,
      @JsonKey(name: 'wind_degree') int windDegree,
      @JsonKey(name: 'wind_dir') String windDire,
      @JsonKey(name: 'pressure_mb') double pressureMb,
      @JsonKey(name: 'pressure_in') double pressureIn,
      @JsonKey(name: 'precip_mm') double precipMm,
      @JsonKey(name: 'precip_in') double precipIn,
      int humidity,
      int cloud,
      @JsonKey(name: 'feelslike_c') double feelsLikeC,
      @JsonKey(name: 'feelslike_f') double feelsLike,
      @JsonKey(name: 'vis_km') double visKm,
      @JsonKey(name: 'vis_miles') double visMiles,
      double uv,
      @JsonKey(name: 'gust_mph') double gustMph,
      @JsonKey(name: 'gust_kph') double gustKph});

  $WeatherCurrentConditionRemoteDTOCopyWith<$Res> get condition;
}

/// @nodoc
class _$WeatherCurrentRemoteDTOCopyWithImpl<$Res,
        $Val extends WeatherCurrentRemoteDTO>
    implements $WeatherCurrentRemoteDTOCopyWith<$Res> {
  _$WeatherCurrentRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdatedEpoch = null,
    Object? lastUpdated = null,
    Object? tempC = null,
    Object? tempF = null,
    Object? isDay = null,
    Object? condition = null,
    Object? windMph = null,
    Object? windKph = null,
    Object? windDegree = null,
    Object? windDire = null,
    Object? pressureMb = null,
    Object? pressureIn = null,
    Object? precipMm = null,
    Object? precipIn = null,
    Object? humidity = null,
    Object? cloud = null,
    Object? feelsLikeC = null,
    Object? feelsLike = null,
    Object? visKm = null,
    Object? visMiles = null,
    Object? uv = null,
    Object? gustMph = null,
    Object? gustKph = null,
  }) {
    return _then(_value.copyWith(
      lastUpdatedEpoch: null == lastUpdatedEpoch
          ? _value.lastUpdatedEpoch
          : lastUpdatedEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      tempC: null == tempC
          ? _value.tempC
          : tempC // ignore: cast_nullable_to_non_nullable
              as double,
      tempF: null == tempF
          ? _value.tempF
          : tempF // ignore: cast_nullable_to_non_nullable
              as double,
      isDay: null == isDay
          ? _value.isDay
          : isDay // ignore: cast_nullable_to_non_nullable
              as int,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as WeatherCurrentConditionRemoteDTO,
      windMph: null == windMph
          ? _value.windMph
          : windMph // ignore: cast_nullable_to_non_nullable
              as double,
      windKph: null == windKph
          ? _value.windKph
          : windKph // ignore: cast_nullable_to_non_nullable
              as double,
      windDegree: null == windDegree
          ? _value.windDegree
          : windDegree // ignore: cast_nullable_to_non_nullable
              as int,
      windDire: null == windDire
          ? _value.windDire
          : windDire // ignore: cast_nullable_to_non_nullable
              as String,
      pressureMb: null == pressureMb
          ? _value.pressureMb
          : pressureMb // ignore: cast_nullable_to_non_nullable
              as double,
      pressureIn: null == pressureIn
          ? _value.pressureIn
          : pressureIn // ignore: cast_nullable_to_non_nullable
              as double,
      precipMm: null == precipMm
          ? _value.precipMm
          : precipMm // ignore: cast_nullable_to_non_nullable
              as double,
      precipIn: null == precipIn
          ? _value.precipIn
          : precipIn // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      cloud: null == cloud
          ? _value.cloud
          : cloud // ignore: cast_nullable_to_non_nullable
              as int,
      feelsLikeC: null == feelsLikeC
          ? _value.feelsLikeC
          : feelsLikeC // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      visKm: null == visKm
          ? _value.visKm
          : visKm // ignore: cast_nullable_to_non_nullable
              as double,
      visMiles: null == visMiles
          ? _value.visMiles
          : visMiles // ignore: cast_nullable_to_non_nullable
              as double,
      uv: null == uv
          ? _value.uv
          : uv // ignore: cast_nullable_to_non_nullable
              as double,
      gustMph: null == gustMph
          ? _value.gustMph
          : gustMph // ignore: cast_nullable_to_non_nullable
              as double,
      gustKph: null == gustKph
          ? _value.gustKph
          : gustKph // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherCurrentConditionRemoteDTOCopyWith<$Res> get condition {
    return $WeatherCurrentConditionRemoteDTOCopyWith<$Res>(_value.condition,
        (value) {
      return _then(_value.copyWith(condition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherCurrentRemoteDTOCopyWith<$Res>
    implements $WeatherCurrentRemoteDTOCopyWith<$Res> {
  factory _$$_WeatherCurrentRemoteDTOCopyWith(_$_WeatherCurrentRemoteDTO value,
          $Res Function(_$_WeatherCurrentRemoteDTO) then) =
      __$$_WeatherCurrentRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'last_updated_epoch') int lastUpdatedEpoch,
      @JsonKey(name: 'last_updated') String lastUpdated,
      @JsonKey(name: 'temp_c') double tempC,
      @JsonKey(name: 'temp_f') double tempF,
      @JsonKey(name: 'is_day') int isDay,
      WeatherCurrentConditionRemoteDTO condition,
      @JsonKey(name: 'wind_mph') double windMph,
      @JsonKey(name: 'wind_kph') double windKph,
      @JsonKey(name: 'wind_degree') int windDegree,
      @JsonKey(name: 'wind_dir') String windDire,
      @JsonKey(name: 'pressure_mb') double pressureMb,
      @JsonKey(name: 'pressure_in') double pressureIn,
      @JsonKey(name: 'precip_mm') double precipMm,
      @JsonKey(name: 'precip_in') double precipIn,
      int humidity,
      int cloud,
      @JsonKey(name: 'feelslike_c') double feelsLikeC,
      @JsonKey(name: 'feelslike_f') double feelsLike,
      @JsonKey(name: 'vis_km') double visKm,
      @JsonKey(name: 'vis_miles') double visMiles,
      double uv,
      @JsonKey(name: 'gust_mph') double gustMph,
      @JsonKey(name: 'gust_kph') double gustKph});

  @override
  $WeatherCurrentConditionRemoteDTOCopyWith<$Res> get condition;
}

/// @nodoc
class __$$_WeatherCurrentRemoteDTOCopyWithImpl<$Res>
    extends _$WeatherCurrentRemoteDTOCopyWithImpl<$Res,
        _$_WeatherCurrentRemoteDTO>
    implements _$$_WeatherCurrentRemoteDTOCopyWith<$Res> {
  __$$_WeatherCurrentRemoteDTOCopyWithImpl(_$_WeatherCurrentRemoteDTO _value,
      $Res Function(_$_WeatherCurrentRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdatedEpoch = null,
    Object? lastUpdated = null,
    Object? tempC = null,
    Object? tempF = null,
    Object? isDay = null,
    Object? condition = null,
    Object? windMph = null,
    Object? windKph = null,
    Object? windDegree = null,
    Object? windDire = null,
    Object? pressureMb = null,
    Object? pressureIn = null,
    Object? precipMm = null,
    Object? precipIn = null,
    Object? humidity = null,
    Object? cloud = null,
    Object? feelsLikeC = null,
    Object? feelsLike = null,
    Object? visKm = null,
    Object? visMiles = null,
    Object? uv = null,
    Object? gustMph = null,
    Object? gustKph = null,
  }) {
    return _then(_$_WeatherCurrentRemoteDTO(
      lastUpdatedEpoch: null == lastUpdatedEpoch
          ? _value.lastUpdatedEpoch
          : lastUpdatedEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      tempC: null == tempC
          ? _value.tempC
          : tempC // ignore: cast_nullable_to_non_nullable
              as double,
      tempF: null == tempF
          ? _value.tempF
          : tempF // ignore: cast_nullable_to_non_nullable
              as double,
      isDay: null == isDay
          ? _value.isDay
          : isDay // ignore: cast_nullable_to_non_nullable
              as int,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as WeatherCurrentConditionRemoteDTO,
      windMph: null == windMph
          ? _value.windMph
          : windMph // ignore: cast_nullable_to_non_nullable
              as double,
      windKph: null == windKph
          ? _value.windKph
          : windKph // ignore: cast_nullable_to_non_nullable
              as double,
      windDegree: null == windDegree
          ? _value.windDegree
          : windDegree // ignore: cast_nullable_to_non_nullable
              as int,
      windDire: null == windDire
          ? _value.windDire
          : windDire // ignore: cast_nullable_to_non_nullable
              as String,
      pressureMb: null == pressureMb
          ? _value.pressureMb
          : pressureMb // ignore: cast_nullable_to_non_nullable
              as double,
      pressureIn: null == pressureIn
          ? _value.pressureIn
          : pressureIn // ignore: cast_nullable_to_non_nullable
              as double,
      precipMm: null == precipMm
          ? _value.precipMm
          : precipMm // ignore: cast_nullable_to_non_nullable
              as double,
      precipIn: null == precipIn
          ? _value.precipIn
          : precipIn // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      cloud: null == cloud
          ? _value.cloud
          : cloud // ignore: cast_nullable_to_non_nullable
              as int,
      feelsLikeC: null == feelsLikeC
          ? _value.feelsLikeC
          : feelsLikeC // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      visKm: null == visKm
          ? _value.visKm
          : visKm // ignore: cast_nullable_to_non_nullable
              as double,
      visMiles: null == visMiles
          ? _value.visMiles
          : visMiles // ignore: cast_nullable_to_non_nullable
              as double,
      uv: null == uv
          ? _value.uv
          : uv // ignore: cast_nullable_to_non_nullable
              as double,
      gustMph: null == gustMph
          ? _value.gustMph
          : gustMph // ignore: cast_nullable_to_non_nullable
              as double,
      gustKph: null == gustKph
          ? _value.gustKph
          : gustKph // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherCurrentRemoteDTO implements _WeatherCurrentRemoteDTO {
  const _$_WeatherCurrentRemoteDTO(
      {@JsonKey(name: 'last_updated_epoch') required this.lastUpdatedEpoch,
      @JsonKey(name: 'last_updated') required this.lastUpdated,
      @JsonKey(name: 'temp_c') required this.tempC,
      @JsonKey(name: 'temp_f') required this.tempF,
      @JsonKey(name: 'is_day') required this.isDay,
      required this.condition,
      @JsonKey(name: 'wind_mph') required this.windMph,
      @JsonKey(name: 'wind_kph') required this.windKph,
      @JsonKey(name: 'wind_degree') required this.windDegree,
      @JsonKey(name: 'wind_dir') required this.windDire,
      @JsonKey(name: 'pressure_mb') required this.pressureMb,
      @JsonKey(name: 'pressure_in') required this.pressureIn,
      @JsonKey(name: 'precip_mm') required this.precipMm,
      @JsonKey(name: 'precip_in') required this.precipIn,
      required this.humidity,
      required this.cloud,
      @JsonKey(name: 'feelslike_c') required this.feelsLikeC,
      @JsonKey(name: 'feelslike_f') required this.feelsLike,
      @JsonKey(name: 'vis_km') required this.visKm,
      @JsonKey(name: 'vis_miles') required this.visMiles,
      required this.uv,
      @JsonKey(name: 'gust_mph') required this.gustMph,
      @JsonKey(name: 'gust_kph') required this.gustKph});

  factory _$_WeatherCurrentRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherCurrentRemoteDTOFromJson(json);

  @override
  @JsonKey(name: 'last_updated_epoch')
  final int lastUpdatedEpoch;
  @override
  @JsonKey(name: 'last_updated')
  final String lastUpdated;
  @override
  @JsonKey(name: 'temp_c')
  final double tempC;
  @override
  @JsonKey(name: 'temp_f')
  final double tempF;
// TODO probably maps to boolean
  @override
  @JsonKey(name: 'is_day')
  final int isDay;
// TODO add condition here
  @override
  final WeatherCurrentConditionRemoteDTO condition;
  @override
  @JsonKey(name: 'wind_mph')
  final double windMph;
  @override
  @JsonKey(name: 'wind_kph')
  final double windKph;
  @override
  @JsonKey(name: 'wind_degree')
  final int windDegree;
  @override
  @JsonKey(name: 'wind_dir')
  final String windDire;
  @override
  @JsonKey(name: 'pressure_mb')
  final double pressureMb;
  @override
  @JsonKey(name: 'pressure_in')
  final double pressureIn;
  @override
  @JsonKey(name: 'precip_mm')
  final double precipMm;
  @override
  @JsonKey(name: 'precip_in')
  final double precipIn;
  @override
  final int humidity;
  @override
  final int cloud;
  @override
  @JsonKey(name: 'feelslike_c')
  final double feelsLikeC;
  @override
  @JsonKey(name: 'feelslike_f')
  final double feelsLike;
  @override
  @JsonKey(name: 'vis_km')
  final double visKm;
  @override
  @JsonKey(name: 'vis_miles')
  final double visMiles;
  @override
  final double uv;
  @override
  @JsonKey(name: 'gust_mph')
  final double gustMph;
  @override
  @JsonKey(name: 'gust_kph')
  final double gustKph;

  @override
  String toString() {
    return 'WeatherCurrentRemoteDTO(lastUpdatedEpoch: $lastUpdatedEpoch, lastUpdated: $lastUpdated, tempC: $tempC, tempF: $tempF, isDay: $isDay, condition: $condition, windMph: $windMph, windKph: $windKph, windDegree: $windDegree, windDire: $windDire, pressureMb: $pressureMb, pressureIn: $pressureIn, precipMm: $precipMm, precipIn: $precipIn, humidity: $humidity, cloud: $cloud, feelsLikeC: $feelsLikeC, feelsLike: $feelsLike, visKm: $visKm, visMiles: $visMiles, uv: $uv, gustMph: $gustMph, gustKph: $gustKph)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherCurrentRemoteDTO &&
            (identical(other.lastUpdatedEpoch, lastUpdatedEpoch) ||
                other.lastUpdatedEpoch == lastUpdatedEpoch) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.tempC, tempC) || other.tempC == tempC) &&
            (identical(other.tempF, tempF) || other.tempF == tempF) &&
            (identical(other.isDay, isDay) || other.isDay == isDay) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.windMph, windMph) || other.windMph == windMph) &&
            (identical(other.windKph, windKph) || other.windKph == windKph) &&
            (identical(other.windDegree, windDegree) ||
                other.windDegree == windDegree) &&
            (identical(other.windDire, windDire) ||
                other.windDire == windDire) &&
            (identical(other.pressureMb, pressureMb) ||
                other.pressureMb == pressureMb) &&
            (identical(other.pressureIn, pressureIn) ||
                other.pressureIn == pressureIn) &&
            (identical(other.precipMm, precipMm) ||
                other.precipMm == precipMm) &&
            (identical(other.precipIn, precipIn) ||
                other.precipIn == precipIn) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.cloud, cloud) || other.cloud == cloud) &&
            (identical(other.feelsLikeC, feelsLikeC) ||
                other.feelsLikeC == feelsLikeC) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike) &&
            (identical(other.visKm, visKm) || other.visKm == visKm) &&
            (identical(other.visMiles, visMiles) ||
                other.visMiles == visMiles) &&
            (identical(other.uv, uv) || other.uv == uv) &&
            (identical(other.gustMph, gustMph) || other.gustMph == gustMph) &&
            (identical(other.gustKph, gustKph) || other.gustKph == gustKph));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        lastUpdatedEpoch,
        lastUpdated,
        tempC,
        tempF,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDire,
        pressureMb,
        pressureIn,
        precipMm,
        precipIn,
        humidity,
        cloud,
        feelsLikeC,
        feelsLike,
        visKm,
        visMiles,
        uv,
        gustMph,
        gustKph
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherCurrentRemoteDTOCopyWith<_$_WeatherCurrentRemoteDTO>
      get copyWith =>
          __$$_WeatherCurrentRemoteDTOCopyWithImpl<_$_WeatherCurrentRemoteDTO>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherCurrentRemoteDTOToJson(
      this,
    );
  }
}

abstract class _WeatherCurrentRemoteDTO implements WeatherCurrentRemoteDTO {
  const factory _WeatherCurrentRemoteDTO(
      {@JsonKey(name: 'last_updated_epoch')
          required final int lastUpdatedEpoch,
      @JsonKey(name: 'last_updated')
          required final String lastUpdated,
      @JsonKey(name: 'temp_c')
          required final double tempC,
      @JsonKey(name: 'temp_f')
          required final double tempF,
      @JsonKey(name: 'is_day')
          required final int isDay,
      required final WeatherCurrentConditionRemoteDTO condition,
      @JsonKey(name: 'wind_mph')
          required final double windMph,
      @JsonKey(name: 'wind_kph')
          required final double windKph,
      @JsonKey(name: 'wind_degree')
          required final int windDegree,
      @JsonKey(name: 'wind_dir')
          required final String windDire,
      @JsonKey(name: 'pressure_mb')
          required final double pressureMb,
      @JsonKey(name: 'pressure_in')
          required final double pressureIn,
      @JsonKey(name: 'precip_mm')
          required final double precipMm,
      @JsonKey(name: 'precip_in')
          required final double precipIn,
      required final int humidity,
      required final int cloud,
      @JsonKey(name: 'feelslike_c')
          required final double feelsLikeC,
      @JsonKey(name: 'feelslike_f')
          required final double feelsLike,
      @JsonKey(name: 'vis_km')
          required final double visKm,
      @JsonKey(name: 'vis_miles')
          required final double visMiles,
      required final double uv,
      @JsonKey(name: 'gust_mph')
          required final double gustMph,
      @JsonKey(name: 'gust_kph')
          required final double gustKph}) = _$_WeatherCurrentRemoteDTO;

  factory _WeatherCurrentRemoteDTO.fromJson(Map<String, dynamic> json) =
      _$_WeatherCurrentRemoteDTO.fromJson;

  @override
  @JsonKey(name: 'last_updated_epoch')
  int get lastUpdatedEpoch;
  @override
  @JsonKey(name: 'last_updated')
  String get lastUpdated;
  @override
  @JsonKey(name: 'temp_c')
  double get tempC;
  @override
  @JsonKey(name: 'temp_f')
  double get tempF;
  @override // TODO probably maps to boolean
  @JsonKey(name: 'is_day')
  int get isDay;
  @override // TODO add condition here
  WeatherCurrentConditionRemoteDTO get condition;
  @override
  @JsonKey(name: 'wind_mph')
  double get windMph;
  @override
  @JsonKey(name: 'wind_kph')
  double get windKph;
  @override
  @JsonKey(name: 'wind_degree')
  int get windDegree;
  @override
  @JsonKey(name: 'wind_dir')
  String get windDire;
  @override
  @JsonKey(name: 'pressure_mb')
  double get pressureMb;
  @override
  @JsonKey(name: 'pressure_in')
  double get pressureIn;
  @override
  @JsonKey(name: 'precip_mm')
  double get precipMm;
  @override
  @JsonKey(name: 'precip_in')
  double get precipIn;
  @override
  int get humidity;
  @override
  int get cloud;
  @override
  @JsonKey(name: 'feelslike_c')
  double get feelsLikeC;
  @override
  @JsonKey(name: 'feelslike_f')
  double get feelsLike;
  @override
  @JsonKey(name: 'vis_km')
  double get visKm;
  @override
  @JsonKey(name: 'vis_miles')
  double get visMiles;
  @override
  double get uv;
  @override
  @JsonKey(name: 'gust_mph')
  double get gustMph;
  @override
  @JsonKey(name: 'gust_kph')
  double get gustKph;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherCurrentRemoteDTOCopyWith<_$_WeatherCurrentRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}

WeatherCurrentConditionRemoteDTO _$WeatherCurrentConditionRemoteDTOFromJson(
    Map<String, dynamic> json) {
  return _WeatherCurrentConditionRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$WeatherCurrentConditionRemoteDTO {
  String get text => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCurrentConditionRemoteDTOCopyWith<WeatherCurrentConditionRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCurrentConditionRemoteDTOCopyWith<$Res> {
  factory $WeatherCurrentConditionRemoteDTOCopyWith(
          WeatherCurrentConditionRemoteDTO value,
          $Res Function(WeatherCurrentConditionRemoteDTO) then) =
      _$WeatherCurrentConditionRemoteDTOCopyWithImpl<$Res,
          WeatherCurrentConditionRemoteDTO>;
  @useResult
  $Res call({String text, String icon, int code});
}

/// @nodoc
class _$WeatherCurrentConditionRemoteDTOCopyWithImpl<$Res,
        $Val extends WeatherCurrentConditionRemoteDTO>
    implements $WeatherCurrentConditionRemoteDTOCopyWith<$Res> {
  _$WeatherCurrentConditionRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? icon = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherCurrentConditionRemoteDTOCopyWith<$Res>
    implements $WeatherCurrentConditionRemoteDTOCopyWith<$Res> {
  factory _$$_WeatherCurrentConditionRemoteDTOCopyWith(
          _$_WeatherCurrentConditionRemoteDTO value,
          $Res Function(_$_WeatherCurrentConditionRemoteDTO) then) =
      __$$_WeatherCurrentConditionRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String icon, int code});
}

/// @nodoc
class __$$_WeatherCurrentConditionRemoteDTOCopyWithImpl<$Res>
    extends _$WeatherCurrentConditionRemoteDTOCopyWithImpl<$Res,
        _$_WeatherCurrentConditionRemoteDTO>
    implements _$$_WeatherCurrentConditionRemoteDTOCopyWith<$Res> {
  __$$_WeatherCurrentConditionRemoteDTOCopyWithImpl(
      _$_WeatherCurrentConditionRemoteDTO _value,
      $Res Function(_$_WeatherCurrentConditionRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? icon = null,
    Object? code = null,
  }) {
    return _then(_$_WeatherCurrentConditionRemoteDTO(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherCurrentConditionRemoteDTO
    implements _WeatherCurrentConditionRemoteDTO {
  const _$_WeatherCurrentConditionRemoteDTO(
      {required this.text, required this.icon, required this.code});

  factory _$_WeatherCurrentConditionRemoteDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_WeatherCurrentConditionRemoteDTOFromJson(json);

  @override
  final String text;
  @override
  final String icon;
  @override
  final int code;

  @override
  String toString() {
    return 'WeatherCurrentConditionRemoteDTO(text: $text, icon: $icon, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherCurrentConditionRemoteDTO &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, icon, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherCurrentConditionRemoteDTOCopyWith<
          _$_WeatherCurrentConditionRemoteDTO>
      get copyWith => __$$_WeatherCurrentConditionRemoteDTOCopyWithImpl<
          _$_WeatherCurrentConditionRemoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherCurrentConditionRemoteDTOToJson(
      this,
    );
  }
}

abstract class _WeatherCurrentConditionRemoteDTO
    implements WeatherCurrentConditionRemoteDTO {
  const factory _WeatherCurrentConditionRemoteDTO(
      {required final String text,
      required final String icon,
      required final int code}) = _$_WeatherCurrentConditionRemoteDTO;

  factory _WeatherCurrentConditionRemoteDTO.fromJson(
      Map<String, dynamic> json) = _$_WeatherCurrentConditionRemoteDTO.fromJson;

  @override
  String get text;
  @override
  String get icon;
  @override
  int get code;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherCurrentConditionRemoteDTOCopyWith<
          _$_WeatherCurrentConditionRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}
