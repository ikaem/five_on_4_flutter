// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MatchRemoteDTO _$$_MatchRemoteDTOFromJson(Map<String, dynamic> json) =>
    _$_MatchRemoteDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      participants: (json['participants'] as List<dynamic>)
          .map((e) =>
              MatchParticipantRemoteDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MatchRemoteDTOToJson(_$_MatchRemoteDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'participants': instance.participants,
    };
