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

MatchParticipantRemoteDTO _$MatchParticipantRemoteDTOFromJson(
    Map<String, dynamic> json) {
  return _MatchParticipantRemoteDTO.fromJson(json);
}

/// @nodoc
mixin _$MatchParticipantRemoteDTO {
  String get id =>
      throw _privateConstructorUsedError; // TODO this should be renamed to player id
  String get userId => throw _privateConstructorUsedError;
  String get matchId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchParticipantRemoteDTOCopyWith<MatchParticipantRemoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchParticipantRemoteDTOCopyWith<$Res> {
  factory $MatchParticipantRemoteDTOCopyWith(MatchParticipantRemoteDTO value,
          $Res Function(MatchParticipantRemoteDTO) then) =
      _$MatchParticipantRemoteDTOCopyWithImpl<$Res, MatchParticipantRemoteDTO>;
  @useResult
  $Res call({String id, String userId, String matchId, String nickname});
}

/// @nodoc
class _$MatchParticipantRemoteDTOCopyWithImpl<$Res,
        $Val extends MatchParticipantRemoteDTO>
    implements $MatchParticipantRemoteDTOCopyWith<$Res> {
  _$MatchParticipantRemoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? matchId = null,
    Object? nickname = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MatchParticipantRemoteDTOCopyWith<$Res>
    implements $MatchParticipantRemoteDTOCopyWith<$Res> {
  factory _$$_MatchParticipantRemoteDTOCopyWith(
          _$_MatchParticipantRemoteDTO value,
          $Res Function(_$_MatchParticipantRemoteDTO) then) =
      __$$_MatchParticipantRemoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String userId, String matchId, String nickname});
}

/// @nodoc
class __$$_MatchParticipantRemoteDTOCopyWithImpl<$Res>
    extends _$MatchParticipantRemoteDTOCopyWithImpl<$Res,
        _$_MatchParticipantRemoteDTO>
    implements _$$_MatchParticipantRemoteDTOCopyWith<$Res> {
  __$$_MatchParticipantRemoteDTOCopyWithImpl(
      _$_MatchParticipantRemoteDTO _value,
      $Res Function(_$_MatchParticipantRemoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? matchId = null,
    Object? nickname = null,
  }) {
    return _then(_$_MatchParticipantRemoteDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MatchParticipantRemoteDTO implements _MatchParticipantRemoteDTO {
  const _$_MatchParticipantRemoteDTO(
      {required this.id,
      required this.userId,
      required this.matchId,
      required this.nickname});

  factory _$_MatchParticipantRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_MatchParticipantRemoteDTOFromJson(json);

  @override
  final String id;
// TODO this should be renamed to player id
  @override
  final String userId;
  @override
  final String matchId;
  @override
  final String nickname;

  @override
  String toString() {
    return 'MatchParticipantRemoteDTO(id: $id, userId: $userId, matchId: $matchId, nickname: $nickname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchParticipantRemoteDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, matchId, nickname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchParticipantRemoteDTOCopyWith<_$_MatchParticipantRemoteDTO>
      get copyWith => __$$_MatchParticipantRemoteDTOCopyWithImpl<
          _$_MatchParticipantRemoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatchParticipantRemoteDTOToJson(
      this,
    );
  }
}

abstract class _MatchParticipantRemoteDTO implements MatchParticipantRemoteDTO {
  const factory _MatchParticipantRemoteDTO(
      {required final String id,
      required final String userId,
      required final String matchId,
      required final String nickname}) = _$_MatchParticipantRemoteDTO;

  factory _MatchParticipantRemoteDTO.fromJson(Map<String, dynamic> json) =
      _$_MatchParticipantRemoteDTO.fromJson;

  @override
  String get id;
  @override // TODO this should be renamed to player id
  String get userId;
  @override
  String get matchId;
  @override
  String get nickname;
  @override
  @JsonKey(ignore: true)
  _$$_MatchParticipantRemoteDTOCopyWith<_$_MatchParticipantRemoteDTO>
      get copyWith => throw _privateConstructorUsedError;
}
