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

/// @nodoc
mixin _$AuthLocalDTO {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthLocalDTOCopyWith<AuthLocalDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthLocalDTOCopyWith<$Res> {
  factory $AuthLocalDTOCopyWith(
          AuthLocalDTO value, $Res Function(AuthLocalDTO) then) =
      _$AuthLocalDTOCopyWithImpl<$Res, AuthLocalDTO>;
  @useResult
  $Res call({String id, String name, String email});
}

/// @nodoc
class _$AuthLocalDTOCopyWithImpl<$Res, $Val extends AuthLocalDTO>
    implements $AuthLocalDTOCopyWith<$Res> {
  _$AuthLocalDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthLocalDTOCopyWith<$Res>
    implements $AuthLocalDTOCopyWith<$Res> {
  factory _$$_AuthLocalDTOCopyWith(
          _$_AuthLocalDTO value, $Res Function(_$_AuthLocalDTO) then) =
      __$$_AuthLocalDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String email});
}

/// @nodoc
class __$$_AuthLocalDTOCopyWithImpl<$Res>
    extends _$AuthLocalDTOCopyWithImpl<$Res, _$_AuthLocalDTO>
    implements _$$_AuthLocalDTOCopyWith<$Res> {
  __$$_AuthLocalDTOCopyWithImpl(
      _$_AuthLocalDTO _value, $Res Function(_$_AuthLocalDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$_AuthLocalDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthLocalDTO implements _AuthLocalDTO {
  const _$_AuthLocalDTO(
      {required this.id, required this.name, required this.email});

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'AuthLocalDTO(id: $id, name: $name, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthLocalDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthLocalDTOCopyWith<_$_AuthLocalDTO> get copyWith =>
      __$$_AuthLocalDTOCopyWithImpl<_$_AuthLocalDTO>(this, _$identity);
}

abstract class _AuthLocalDTO implements AuthLocalDTO {
  const factory _AuthLocalDTO(
      {required final String id,
      required final String name,
      required final String email}) = _$_AuthLocalDTO;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_AuthLocalDTOCopyWith<_$_AuthLocalDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
