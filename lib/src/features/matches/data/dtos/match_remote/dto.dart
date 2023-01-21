import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';
part 'dto.g.dart';

@freezed
// TODO this will have much more fields
class MatchRemoteDTO with _$MatchRemoteDTO {
  const factory MatchRemoteDTO({
    required String id,
    required String name,
  }) = _MatchRemoteDTO;

  factory MatchRemoteDTO.fromJson(Map<String, dynamic> map) =>
      _$MatchRemoteDTOFromJson(map);
}
