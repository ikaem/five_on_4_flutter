// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherModel {
  String get locationName => throw _privateConstructorUsedError;
  double get temperatureCelsius => throw _privateConstructorUsedError;
  String get weatherDescription => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherModelCopyWith<WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherModelCopyWith<$Res> {
  factory $WeatherModelCopyWith(
          WeatherModel value, $Res Function(WeatherModel) then) =
      _$WeatherModelCopyWithImpl<$Res, WeatherModel>;
  @useResult
  $Res call(
      {String locationName,
      double temperatureCelsius,
      String weatherDescription});
}

/// @nodoc
class _$WeatherModelCopyWithImpl<$Res, $Val extends WeatherModel>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationName = null,
    Object? temperatureCelsius = null,
    Object? weatherDescription = null,
  }) {
    return _then(_value.copyWith(
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      temperatureCelsius: null == temperatureCelsius
          ? _value.temperatureCelsius
          : temperatureCelsius // ignore: cast_nullable_to_non_nullable
              as double,
      weatherDescription: null == weatherDescription
          ? _value.weatherDescription
          : weatherDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherModelCopyWith<$Res>
    implements $WeatherModelCopyWith<$Res> {
  factory _$$_WeatherModelCopyWith(
          _$_WeatherModel value, $Res Function(_$_WeatherModel) then) =
      __$$_WeatherModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String locationName,
      double temperatureCelsius,
      String weatherDescription});
}

/// @nodoc
class __$$_WeatherModelCopyWithImpl<$Res>
    extends _$WeatherModelCopyWithImpl<$Res, _$_WeatherModel>
    implements _$$_WeatherModelCopyWith<$Res> {
  __$$_WeatherModelCopyWithImpl(
      _$_WeatherModel _value, $Res Function(_$_WeatherModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationName = null,
    Object? temperatureCelsius = null,
    Object? weatherDescription = null,
  }) {
    return _then(_$_WeatherModel(
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      temperatureCelsius: null == temperatureCelsius
          ? _value.temperatureCelsius
          : temperatureCelsius // ignore: cast_nullable_to_non_nullable
              as double,
      weatherDescription: null == weatherDescription
          ? _value.weatherDescription
          : weatherDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WeatherModel implements _WeatherModel {
  const _$_WeatherModel(
      {required this.locationName,
      required this.temperatureCelsius,
      required this.weatherDescription});

  @override
  final String locationName;
  @override
  final double temperatureCelsius;
  @override
  final String weatherDescription;

  @override
  String toString() {
    return 'WeatherModel(locationName: $locationName, temperatureCelsius: $temperatureCelsius, weatherDescription: $weatherDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherModel &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.temperatureCelsius, temperatureCelsius) ||
                other.temperatureCelsius == temperatureCelsius) &&
            (identical(other.weatherDescription, weatherDescription) ||
                other.weatherDescription == weatherDescription));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, locationName, temperatureCelsius, weatherDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherModelCopyWith<_$_WeatherModel> get copyWith =>
      __$$_WeatherModelCopyWithImpl<_$_WeatherModel>(this, _$identity);
}

abstract class _WeatherModel implements WeatherModel {
  const factory _WeatherModel(
      {required final String locationName,
      required final double temperatureCelsius,
      required final String weatherDescription}) = _$_WeatherModel;

  @override
  String get locationName;
  @override
  double get temperatureCelsius;
  @override
  String get weatherDescription;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherModelCopyWith<_$_WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}
