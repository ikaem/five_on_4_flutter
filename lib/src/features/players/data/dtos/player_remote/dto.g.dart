// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerRemoteDTO _$$_PlayerRemoteDTOFromJson(Map<String, dynamic> json) =>
    _$_PlayerRemoteDTO(
      id: json['id'] as String,
      authId: json['authId'] as String,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$_PlayerRemoteDTOToJson(_$_PlayerRemoteDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authId': instance.authId,
      'nickname': instance.nickname,
      'email': instance.email,
    };
