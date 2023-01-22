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
mixin _$MatchCreateCubitState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  FormFieldError? get nameError => throw _privateConstructorUsedError;
  FormFieldError? get organizerError => throw _privateConstructorUsedError;
  FormFieldError? get timeAndDateError => throw _privateConstructorUsedError;
  FormFieldError? get locationError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MatchCreateCubitStateCopyWith<MatchCreateCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchCreateCubitStateCopyWith<$Res> {
  factory $MatchCreateCubitStateCopyWith(MatchCreateCubitState value,
          $Res Function(MatchCreateCubitState) then) =
      _$MatchCreateCubitStateCopyWithImpl<$Res, MatchCreateCubitState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool? isSuccess,
      FormFieldError? nameError,
      FormFieldError? organizerError,
      FormFieldError? timeAndDateError,
      FormFieldError? locationError});
}

/// @nodoc
class _$MatchCreateCubitStateCopyWithImpl<$Res,
        $Val extends MatchCreateCubitState>
    implements $MatchCreateCubitStateCopyWith<$Res> {
  _$MatchCreateCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = freezed,
    Object? nameError = freezed,
    Object? organizerError = freezed,
    Object? timeAndDateError = freezed,
    Object? locationError = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      nameError: freezed == nameError
          ? _value.nameError
          : nameError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
      organizerError: freezed == organizerError
          ? _value.organizerError
          : organizerError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
      timeAndDateError: freezed == timeAndDateError
          ? _value.timeAndDateError
          : timeAndDateError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
      locationError: freezed == locationError
          ? _value.locationError
          : locationError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MatchCreateCubitStateCopyWith<$Res>
    implements $MatchCreateCubitStateCopyWith<$Res> {
  factory _$$_MatchCreateCubitStateCopyWith(_$_MatchCreateCubitState value,
          $Res Function(_$_MatchCreateCubitState) then) =
      __$$_MatchCreateCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool? isSuccess,
      FormFieldError? nameError,
      FormFieldError? organizerError,
      FormFieldError? timeAndDateError,
      FormFieldError? locationError});
}

/// @nodoc
class __$$_MatchCreateCubitStateCopyWithImpl<$Res>
    extends _$MatchCreateCubitStateCopyWithImpl<$Res, _$_MatchCreateCubitState>
    implements _$$_MatchCreateCubitStateCopyWith<$Res> {
  __$$_MatchCreateCubitStateCopyWithImpl(_$_MatchCreateCubitState _value,
      $Res Function(_$_MatchCreateCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = freezed,
    Object? nameError = freezed,
    Object? organizerError = freezed,
    Object? timeAndDateError = freezed,
    Object? locationError = freezed,
  }) {
    return _then(_$_MatchCreateCubitState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      nameError: freezed == nameError
          ? _value.nameError
          : nameError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
      organizerError: freezed == organizerError
          ? _value.organizerError
          : organizerError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
      timeAndDateError: freezed == timeAndDateError
          ? _value.timeAndDateError
          : timeAndDateError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
      locationError: freezed == locationError
          ? _value.locationError
          : locationError // ignore: cast_nullable_to_non_nullable
              as FormFieldError?,
    ));
  }
}

/// @nodoc

class _$_MatchCreateCubitState implements _MatchCreateCubitState {
  const _$_MatchCreateCubitState(
      {this.isLoading = false,
      this.isSuccess,
      this.nameError,
      this.organizerError,
      this.timeAndDateError,
      this.locationError});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final bool? isSuccess;
  @override
  final FormFieldError? nameError;
  @override
  final FormFieldError? organizerError;
  @override
  final FormFieldError? timeAndDateError;
  @override
  final FormFieldError? locationError;

  @override
  String toString() {
    return 'MatchCreateCubitState(isLoading: $isLoading, isSuccess: $isSuccess, nameError: $nameError, organizerError: $organizerError, timeAndDateError: $timeAndDateError, locationError: $locationError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchCreateCubitState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.nameError, nameError) ||
                other.nameError == nameError) &&
            (identical(other.organizerError, organizerError) ||
                other.organizerError == organizerError) &&
            (identical(other.timeAndDateError, timeAndDateError) ||
                other.timeAndDateError == timeAndDateError) &&
            (identical(other.locationError, locationError) ||
                other.locationError == locationError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSuccess, nameError,
      organizerError, timeAndDateError, locationError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchCreateCubitStateCopyWith<_$_MatchCreateCubitState> get copyWith =>
      __$$_MatchCreateCubitStateCopyWithImpl<_$_MatchCreateCubitState>(
          this, _$identity);
}

abstract class _MatchCreateCubitState implements MatchCreateCubitState {
  const factory _MatchCreateCubitState(
      {final bool isLoading,
      final bool? isSuccess,
      final FormFieldError? nameError,
      final FormFieldError? organizerError,
      final FormFieldError? timeAndDateError,
      final FormFieldError? locationError}) = _$_MatchCreateCubitState;

  @override
  bool get isLoading;
  @override
  bool? get isSuccess;
  @override
  FormFieldError? get nameError;
  @override
  FormFieldError? get organizerError;
  @override
  FormFieldError? get timeAndDateError;
  @override
  FormFieldError? get locationError;
  @override
  @JsonKey(ignore: true)
  _$$_MatchCreateCubitStateCopyWith<_$_MatchCreateCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
