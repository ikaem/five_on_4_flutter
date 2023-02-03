// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthStatusCubitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStatusCubitStateInitial value) initial,
    required TResult Function(AuthStatusCubitStateFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStatusCubitStateInitial value)? initial,
    TResult? Function(AuthStatusCubitStateFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStatusCubitStateInitial value)? initial,
    TResult Function(AuthStatusCubitStateFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStatusCubitStateCopyWith<$Res> {
  factory $AuthStatusCubitStateCopyWith(AuthStatusCubitState value,
          $Res Function(AuthStatusCubitState) then) =
      _$AuthStatusCubitStateCopyWithImpl<$Res, AuthStatusCubitState>;
}

/// @nodoc
class _$AuthStatusCubitStateCopyWithImpl<$Res,
        $Val extends AuthStatusCubitState>
    implements $AuthStatusCubitStateCopyWith<$Res> {
  _$AuthStatusCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthStatusCubitStateInitialCopyWith<$Res> {
  factory _$$AuthStatusCubitStateInitialCopyWith(
          _$AuthStatusCubitStateInitial value,
          $Res Function(_$AuthStatusCubitStateInitial) then) =
      __$$AuthStatusCubitStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStatusCubitStateInitialCopyWithImpl<$Res>
    extends _$AuthStatusCubitStateCopyWithImpl<$Res,
        _$AuthStatusCubitStateInitial>
    implements _$$AuthStatusCubitStateInitialCopyWith<$Res> {
  __$$AuthStatusCubitStateInitialCopyWithImpl(
      _$AuthStatusCubitStateInitial _value,
      $Res Function(_$AuthStatusCubitStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStatusCubitStateInitial implements AuthStatusCubitStateInitial {
  _$AuthStatusCubitStateInitial();

  @override
  String toString() {
    return 'AuthStatusCubitState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStatusCubitStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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
    required TResult Function(AuthStatusCubitStateInitial value) initial,
    required TResult Function(AuthStatusCubitStateFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStatusCubitStateInitial value)? initial,
    TResult? Function(AuthStatusCubitStateFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStatusCubitStateInitial value)? initial,
    TResult Function(AuthStatusCubitStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthStatusCubitStateInitial implements AuthStatusCubitState {
  factory AuthStatusCubitStateInitial() = _$AuthStatusCubitStateInitial;
}

/// @nodoc
abstract class _$$AuthStatusCubitStateFailureCopyWith<$Res> {
  factory _$$AuthStatusCubitStateFailureCopyWith(
          _$AuthStatusCubitStateFailure value,
          $Res Function(_$AuthStatusCubitStateFailure) then) =
      __$$AuthStatusCubitStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthStatusCubitStateFailureCopyWithImpl<$Res>
    extends _$AuthStatusCubitStateCopyWithImpl<$Res,
        _$AuthStatusCubitStateFailure>
    implements _$$AuthStatusCubitStateFailureCopyWith<$Res> {
  __$$AuthStatusCubitStateFailureCopyWithImpl(
      _$AuthStatusCubitStateFailure _value,
      $Res Function(_$AuthStatusCubitStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthStatusCubitStateFailure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthStatusCubitStateFailure implements AuthStatusCubitStateFailure {
  _$AuthStatusCubitStateFailure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthStatusCubitState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStatusCubitStateFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStatusCubitStateFailureCopyWith<_$AuthStatusCubitStateFailure>
      get copyWith => __$$AuthStatusCubitStateFailureCopyWithImpl<
          _$AuthStatusCubitStateFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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
    required TResult Function(AuthStatusCubitStateInitial value) initial,
    required TResult Function(AuthStatusCubitStateFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStatusCubitStateInitial value)? initial,
    TResult? Function(AuthStatusCubitStateFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStatusCubitStateInitial value)? initial,
    TResult Function(AuthStatusCubitStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AuthStatusCubitStateFailure implements AuthStatusCubitState {
  factory AuthStatusCubitStateFailure(final String message) =
      _$AuthStatusCubitStateFailure;

  String get message;
  @JsonKey(ignore: true)
  _$$AuthStatusCubitStateFailureCopyWith<_$AuthStatusCubitStateFailure>
      get copyWith => throw _privateConstructorUsedError;
}
