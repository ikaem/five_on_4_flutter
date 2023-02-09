import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';
part 'dto.g.dart';

@freezed
// TODO this will have much more fields
class MatchRemoteDTO with _$MatchRemoteDTO {
  const factory MatchRemoteDTO({
    required String id,
    required String name,
    // TODO in the future, we will have to make this something like status of player joined - so again some reference or something - or just keep it in the database
    required List<String> players,
  }) = _MatchRemoteDTO;

  factory MatchRemoteDTO.fromJson(Map<String, dynamic> map) =>
      _$MatchRemoteDTOFromJson(map);
}
