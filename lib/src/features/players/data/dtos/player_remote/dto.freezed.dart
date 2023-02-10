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

PlayerRemoteDTO _$PlayerRemoteDTOFromJson(Map<String, dynamic> json) {
  return _PlayerRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$PlayerRemoteDTO {
  String get id => throw _privateConstructorUsedError;
  String get authId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerRemoteDTOCopyWith<PlayerRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerRemoteDTOCopyWith<$Res> {
  factory $PlayerRemoteDTOCopyWith(
          PlayerRemoteDTO value, $Res Function(PlayerRemoteDTO) then) =
      _$PlayerRemoteDTOCopyWithImpl<$Res, PlayerRemoteDTO>;
  @useResult
  $Res call({String id, String authId, String nickname, String email});
}

/// @nodoc
class _$PlayerRemoteDTOCopyWithImpl<$Res, $Val extends PlayerRemoteDTO>
    implements $PlayerRemoteDTOCopyWith<$Res> {
  _$PlayerRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authId = null,
    Object? nickname = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      authId: null == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerRemoteDTOCopyWith<$Res>
    implements $PlayerRemoteDTOCopyWith<$Res> {
  factory _$$_PlayerRemoteDTOCopyWith(
          _$_PlayerRemoteDTO value, $Res Function(_$_PlayerRemoteDTO) then) =
      __$$_PlayerRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String authId, String nickname, String email});
}

/// @nodoc
class __$$_PlayerRemoteDTOCopyWithImpl<$Res>
    extends _$PlayerRemoteDTOCopyWithImpl<$Res, _$_PlayerRemoteDTO>
    implements _$$_PlayerRemoteDTOCopyWith<$Res> {
  __$$_PlayerRemoteDTOCopyWithImpl(
      _$_PlayerRemoteDTO _value, $Res Function(_$_PlayerRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authId = null,
    Object? nickname = null,
    Object? email = null,
  }) {
    return _then(_$_PlayerRemoteDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      authId: null == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlayerRemoteDTO implements _PlayerRemoteDTO {
  const _$_PlayerRemoteDTO(
      {required this.id,
      required this.authId,
      required this.nickname,
      required this.email});

  factory _$_PlayerRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerRemoteDTOFromJson(json);

  @override
  final String id;
  @override
  final String authId;
  @override
  final String nickname;
  @override
  final String email;

  @override
  String toString() {
    return 'PlayerRemoteDTO(id: $id, authId: $authId, nickname: $nickname, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerRemoteDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authId, authId) || other.authId == authId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, authId, nickname, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerRemoteDTOCopyWith<_$_PlayerRemoteDTO> get copyWith =>
      __$$_PlayerRemoteDTOCopyWithImpl<_$_PlayerRemoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerRemoteDTOToJson(
      this,
    );
  }
}

abstract class _PlayerRemoteDTO implements PlayerRemoteDTO {
  const factory _PlayerRemoteDTO(
      {required final String id,
      required final String authId,
      required final String nickname,
      required final String email}) = _$_PlayerRemoteDTO;

  factory _PlayerRemoteDTO.fromJson(Map<String, dynamic> json) =
      _$_PlayerRemoteDTO.fromJson;

  @override
  String get id;
  @override
  String get authId;
  @override
  String get nickname;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerRemoteDTOCopyWith<_$_PlayerRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
