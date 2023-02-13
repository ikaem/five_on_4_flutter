// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MatchParticipantRemoteDTO _$$_MatchParticipantRemoteDTOFromJson(
        Map<String, dynamic> json) =>
    _$_MatchParticipantRemoteDTO(
      id: json['id'] as String,
      userId: json['userId'] as String,
      matchId: json['matchId'] as String,
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$$_MatchParticipantRemoteDTOToJson(
        _$_MatchParticipantRemoteDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'matchId': instance.matchId,
      'nickname': instance.nickname,
    };
