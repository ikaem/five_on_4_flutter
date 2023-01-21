// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MatchesGetMyTodaysBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMatches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMatches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMatches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchesGetMyTodaysBlocLoadMatchesEvent value)
        loadMatches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesGetMyTodaysBlocLoadMatchesEvent value)?
        loadMatches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesGetMyTodaysBlocLoadMatchesEvent value)? loadMatches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchesGetMyTodaysBlocEventCopyWith<$Res> {
  factory $MatchesGetMyTodaysBlocEventCopyWith(
          MatchesGetMyTodaysBlocEvent value,
          $Res Function(MatchesGetMyTodaysBlocEvent) then) =
      _$MatchesGetMyTodaysBlocEventCopyWithImpl<$Res,
          MatchesGetMyTodaysBlocEvent>;
}

/// @nodoc
class _$MatchesGetMyTodaysBlocEventCopyWithImpl<$Res,
        $Val extends MatchesGetMyTodaysBlocEvent>
    implements $MatchesGetMyTodaysBlocEventCopyWith<$Res> {
  _$MatchesGetMyTodaysBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MatchesGetMyTodaysBlocLoadMatchesEventCopyWith<$Res> {
  factory _$$MatchesGetMyTodaysBlocLoadMatchesEventCopyWith(
          _$MatchesGetMyTodaysBlocLoadMatchesEvent value,
          $Res Function(_$MatchesGetMyTodaysBlocLoadMatchesEvent) then) =
      __$$MatchesGetMyTodaysBlocLoadMatchesEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MatchesGetMyTodaysBlocLoadMatchesEventCopyWithImpl<$Res>
    extends _$MatchesGetMyTodaysBlocEventCopyWithImpl<$Res,
        _$MatchesGetMyTodaysBlocLoadMatchesEvent>
    implements _$$MatchesGetMyTodaysBlocLoadMatchesEventCopyWith<$Res> {
  __$$MatchesGetMyTodaysBlocLoadMatchesEventCopyWithImpl(
      _$MatchesGetMyTodaysBlocLoadMatchesEvent _value,
      $Res Function(_$MatchesGetMyTodaysBlocLoadMatchesEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MatchesGetMyTodaysBlocLoadMatchesEvent
    implements MatchesGetMyTodaysBlocLoadMatchesEvent {
  _$MatchesGetMyTodaysBlocLoadMatchesEvent();

  @override
  String toString() {
    return 'MatchesGetMyTodaysBlocEvent.loadMatches()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesGetMyTodaysBlocLoadMatchesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMatches,
  }) {
    return loadMatches();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMatches,
  }) {
    return loadMatches?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMatches,
    required TResult orElse(),
  }) {
    if (loadMatches != null) {
      return loadMatches();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchesGetMyTodaysBlocLoadMatchesEvent value)
        loadMatches,
  }) {
    return loadMatches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesGetMyTodaysBlocLoadMatchesEvent value)?
        loadMatches,
  }) {
    return loadMatches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesGetMyTodaysBlocLoadMatchesEvent value)? loadMatches,
    required TResult orElse(),
  }) {
    if (loadMatches != null) {
      return loadMatches(this);
    }
    return orElse();
  }
}

abstract class MatchesGetMyTodaysBlocLoadMatchesEvent
    implements MatchesGetMyTodaysBlocEvent {
  factory MatchesGetMyTodaysBlocLoadMatchesEvent() =
      _$MatchesGetMyTodaysBlocLoadMatchesEvent;
}

/// @nodoc
mixin _$MatchesGetMyTodaysBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherModel weather) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(WeatherModel weather)? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherModel weather)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchesGetMyTodaysBlocStateInitial value) initial,
    required TResult Function(MatchesGetMyTodaysBlocStateLoading value) loading,
    required TResult Function(MatchesGetMyTodaysBlocStateSuccess value) success,
    required TResult Function(MatchesGetMyTodaysBlocStateFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesGetMyTodaysBlocStateInitial value)? initial,
    TResult? Function(MatchesGetMyTodaysBlocStateLoading value)? loading,
    TResult? Function(MatchesGetMyTodaysBlocStateSuccess value)? success,
    TResult? Function(MatchesGetMyTodaysBlocStateFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesGetMyTodaysBlocStateInitial value)? initial,
    TResult Function(MatchesGetMyTodaysBlocStateLoading value)? loading,
    TResult Function(MatchesGetMyTodaysBlocStateSuccess value)? success,
    TResult Function(MatchesGetMyTodaysBlocStateFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchesGetMyTodaysBlocStateCopyWith<$Res> {
  factory $MatchesGetMyTodaysBlocStateCopyWith(
          MatchesGetMyTodaysBlocState value,
          $Res Function(MatchesGetMyTodaysBlocState) then) =
      _$MatchesGetMyTodaysBlocStateCopyWithImpl<$Res,
          MatchesGetMyTodaysBlocState>;
}

/// @nodoc
class _$MatchesGetMyTodaysBlocStateCopyWithImpl<$Res,
        $Val extends MatchesGetMyTodaysBlocState>
    implements $MatchesGetMyTodaysBlocStateCopyWith<$Res> {
  _$MatchesGetMyTodaysBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MatchesGetMyTodaysBlocStateInitialCopyWith<$Res> {
  factory _$$MatchesGetMyTodaysBlocStateInitialCopyWith(
          _$MatchesGetMyTodaysBlocStateInitial value,
          $Res Function(_$MatchesGetMyTodaysBlocStateInitial) then) =
      __$$MatchesGetMyTodaysBlocStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MatchesGetMyTodaysBlocStateInitialCopyWithImpl<$Res>
    extends _$MatchesGetMyTodaysBlocStateCopyWithImpl<$Res,
        _$MatchesGetMyTodaysBlocStateInitial>
    implements _$$MatchesGetMyTodaysBlocStateInitialCopyWith<$Res> {
  __$$MatchesGetMyTodaysBlocStateInitialCopyWithImpl(
      _$MatchesGetMyTodaysBlocStateInitial _value,
      $Res Function(_$MatchesGetMyTodaysBlocStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MatchesGetMyTodaysBlocStateInitial
    implements MatchesGetMyTodaysBlocStateInitial {
  _$MatchesGetMyTodaysBlocStateInitial();

  @override
  String toString() {
    return 'MatchesGetMyTodaysBlocState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesGetMyTodaysBlocStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherModel weather) success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(WeatherModel weather)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherModel weather)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchesGetMyTodaysBlocStateInitial value) initial,
    required TResult Function(MatchesGetMyTodaysBlocStateLoading value) loading,
    required TResult Function(MatchesGetMyTodaysBlocStateSuccess value) success,
    required TResult Function(MatchesGetMyTodaysBlocStateFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesGetMyTodaysBlocStateInitial value)? initial,
    TResult? Function(MatchesGetMyTodaysBlocStateLoading value)? loading,
    TResult? Function(MatchesGetMyTodaysBlocStateSuccess value)? success,
    TResult? Function(MatchesGetMyTodaysBlocStateFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesGetMyTodaysBlocStateInitial value)? initial,
    TResult Function(MatchesGetMyTodaysBlocStateLoading value)? loading,
    TResult Function(MatchesGetMyTodaysBlocStateSuccess value)? success,
    TResult Function(MatchesGetMyTodaysBlocStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MatchesGetMyTodaysBlocStateInitial
    implements MatchesGetMyTodaysBlocState {
  factory MatchesGetMyTodaysBlocStateInitial() =
      _$MatchesGetMyTodaysBlocStateInitial;
}

/// @nodoc
abstract class _$$MatchesGetMyTodaysBlocStateLoadingCopyWith<$Res> {
  factory _$$MatchesGetMyTodaysBlocStateLoadingCopyWith(
          _$MatchesGetMyTodaysBlocStateLoading value,
          $Res Function(_$MatchesGetMyTodaysBlocStateLoading) then) =
      __$$MatchesGetMyTodaysBlocStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MatchesGetMyTodaysBlocStateLoadingCopyWithImpl<$Res>
    extends _$MatchesGetMyTodaysBlocStateCopyWithImpl<$Res,
        _$MatchesGetMyTodaysBlocStateLoading>
    implements _$$MatchesGetMyTodaysBlocStateLoadingCopyWith<$Res> {
  __$$MatchesGetMyTodaysBlocStateLoadingCopyWithImpl(
      _$MatchesGetMyTodaysBlocStateLoading _value,
      $Res Function(_$MatchesGetMyTodaysBlocStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MatchesGetMyTodaysBlocStateLoading
    implements MatchesGetMyTodaysBlocStateLoading {
  _$MatchesGetMyTodaysBlocStateLoading();

  @override
  String toString() {
    return 'MatchesGetMyTodaysBlocState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesGetMyTodaysBlocStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherModel weather) success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(WeatherModel weather)? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherModel weather)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchesGetMyTodaysBlocStateInitial value) initial,
    required TResult Function(MatchesGetMyTodaysBlocStateLoading value) loading,
    required TResult Function(MatchesGetMyTodaysBlocStateSuccess value) success,
    required TResult Function(MatchesGetMyTodaysBlocStateFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesGetMyTodaysBlocStateInitial value)? initial,
    TResult? Function(MatchesGetMyTodaysBlocStateLoading value)? loading,
    TResult? Function(MatchesGetMyTodaysBlocStateSuccess value)? success,
    TResult? Function(MatchesGetMyTodaysBlocStateFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesGetMyTodaysBlocStateInitial value)? initial,
    TResult Function(MatchesGetMyTodaysBlocStateLoading value)? loading,
    TResult Function(MatchesGetMyTodaysBlocStateSuccess value)? success,
    TResult Function(MatchesGetMyTodaysBlocStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MatchesGetMyTodaysBlocStateLoading
    implements MatchesGetMyTodaysBlocState {
  factory MatchesGetMyTodaysBlocStateLoading() =
      _$MatchesGetMyTodaysBlocStateLoading;
}

/// @nodoc
abstract class _$$MatchesGetMyTodaysBlocStateSuccessCopyWith<$Res> {
  factory _$$MatchesGetMyTodaysBlocStateSuccessCopyWith(
          _$MatchesGetMyTodaysBlocStateSuccess value,
          $Res Function(_$MatchesGetMyTodaysBlocStateSuccess) then) =
      __$$MatchesGetMyTodaysBlocStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({WeatherModel weather});
}

/// @nodoc
class __$$MatchesGetMyTodaysBlocStateSuccessCopyWithImpl<$Res>
    extends _$MatchesGetMyTodaysBlocStateCopyWithImpl<$Res,
        _$MatchesGetMyTodaysBlocStateSuccess>
    implements _$$MatchesGetMyTodaysBlocStateSuccessCopyWith<$Res> {
  __$$MatchesGetMyTodaysBlocStateSuccessCopyWithImpl(
      _$MatchesGetMyTodaysBlocStateSuccess _value,
      $Res Function(_$MatchesGetMyTodaysBlocStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = freezed,
  }) {
    return _then(_$MatchesGetMyTodaysBlocStateSuccess(
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as WeatherModel,
    ));
  }
}

/// @nodoc

class _$MatchesGetMyTodaysBlocStateSuccess
    implements MatchesGetMyTodaysBlocStateSuccess {
  _$MatchesGetMyTodaysBlocStateSuccess({required this.weather});

  @override
  final WeatherModel weather;

  @override
  String toString() {
    return 'MatchesGetMyTodaysBlocState.success(weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesGetMyTodaysBlocStateSuccess &&
            const DeepCollectionEquality().equals(other.weather, weather));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(weather));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchesGetMyTodaysBlocStateSuccessCopyWith<
          _$MatchesGetMyTodaysBlocStateSuccess>
      get copyWith => __$$MatchesGetMyTodaysBlocStateSuccessCopyWithImpl<
          _$MatchesGetMyTodaysBlocStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherModel weather) success,
    required TResult Function(String message) failure,
  }) {
    return success(weather);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(WeatherModel weather)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(weather);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherModel weather)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(weather);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchesGetMyTodaysBlocStateInitial value) initial,
    required TResult Function(MatchesGetMyTodaysBlocStateLoading value) loading,
    required TResult Function(MatchesGetMyTodaysBlocStateSuccess value) success,
    required TResult Function(MatchesGetMyTodaysBlocStateFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesGetMyTodaysBlocStateInitial value)? initial,
    TResult? Function(MatchesGetMyTodaysBlocStateLoading value)? loading,
    TResult? Function(MatchesGetMyTodaysBlocStateSuccess value)? success,
    TResult? Function(MatchesGetMyTodaysBlocStateFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesGetMyTodaysBlocStateInitial value)? initial,
    TResult Function(MatchesGetMyTodaysBlocStateLoading value)? loading,
    TResult Function(MatchesGetMyTodaysBlocStateSuccess value)? success,
    TResult Function(MatchesGetMyTodaysBlocStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class MatchesGetMyTodaysBlocStateSuccess
    implements MatchesGetMyTodaysBlocState {
  factory MatchesGetMyTodaysBlocStateSuccess(
          {required final WeatherModel weather}) =
      _$MatchesGetMyTodaysBlocStateSuccess;

  WeatherModel get weather;
  @JsonKey(ignore: true)
  _$$MatchesGetMyTodaysBlocStateSuccessCopyWith<
          _$MatchesGetMyTodaysBlocStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MatchesGetMyTodaysBlocStateFailureCopyWith<$Res> {
  factory _$$MatchesGetMyTodaysBlocStateFailureCopyWith(
          _$MatchesGetMyTodaysBlocStateFailure value,
          $Res Function(_$MatchesGetMyTodaysBlocStateFailure) then) =
      __$$MatchesGetMyTodaysBlocStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MatchesGetMyTodaysBlocStateFailureCopyWithImpl<$Res>
    extends _$MatchesGetMyTodaysBlocStateCopyWithImpl<$Res,
        _$MatchesGetMyTodaysBlocStateFailure>
    implements _$$MatchesGetMyTodaysBlocStateFailureCopyWith<$Res> {
  __$$MatchesGetMyTodaysBlocStateFailureCopyWithImpl(
      _$MatchesGetMyTodaysBlocStateFailure _value,
      $Res Function(_$MatchesGetMyTodaysBlocStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$MatchesGetMyTodaysBlocStateFailure(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MatchesGetMyTodaysBlocStateFailure
    implements MatchesGetMyTodaysBlocStateFailure {
  _$MatchesGetMyTodaysBlocStateFailure({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'MatchesGetMyTodaysBlocState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesGetMyTodaysBlocStateFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchesGetMyTodaysBlocStateFailureCopyWith<
          _$MatchesGetMyTodaysBlocStateFailure>
      get copyWith => __$$MatchesGetMyTodaysBlocStateFailureCopyWithImpl<
          _$MatchesGetMyTodaysBlocStateFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WeatherModel weather) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(WeatherModel weather)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WeatherModel weather)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchesGetMyTodaysBlocStateInitial value) initial,
    required TResult Function(MatchesGetMyTodaysBlocStateLoading value) loading,
    required TResult Function(MatchesGetMyTodaysBlocStateSuccess value) success,
    required TResult Function(MatchesGetMyTodaysBlocStateFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesGetMyTodaysBlocStateInitial value)? initial,
    TResult? Function(MatchesGetMyTodaysBlocStateLoading value)? loading,
    TResult? Function(MatchesGetMyTodaysBlocStateSuccess value)? success,
    TResult? Function(MatchesGetMyTodaysBlocStateFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesGetMyTodaysBlocStateInitial value)? initial,
    TResult Function(MatchesGetMyTodaysBlocStateLoading value)? loading,
    TResult Function(MatchesGetMyTodaysBlocStateSuccess value)? success,
    TResult Function(MatchesGetMyTodaysBlocStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class MatchesGetMyTodaysBlocStateFailure
    implements MatchesGetMyTodaysBlocState {
  factory MatchesGetMyTodaysBlocStateFailure({required final String message}) =
      _$MatchesGetMyTodaysBlocStateFailure;

  String get message;
  @JsonKey(ignore: true)
  _$$MatchesGetMyTodaysBlocStateFailureCopyWith<
          _$MatchesGetMyTodaysBlocStateFailure>
      get copyWith => throw _privateConstructorUsedError;
}
