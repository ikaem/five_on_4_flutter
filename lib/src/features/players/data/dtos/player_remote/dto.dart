import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';
part 'dto.g.dart';

@freezed
class PlayerRemoteDTO with _$PlayerRemoteDTO {
  const factory PlayerRemoteDTO({
    required String id,
    // required String authId,
    required String nickname,
    required String email,
  }) = _PlayerRemoteDTO;

  factory PlayerRemoteDTO.fromFirestoreSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final Map<String, dynamic> playerData = snapshot.data()!;

    final String playerId = snapshot.id;
    // final String playerAuthId = snapshot['authId'] as String;
    final String playerEmail = playerData['email'] as String;
    final String playerNickname = playerData['nickname'] as String;

    final PlayerRemoteDTO playerRemoteDTO = PlayerRemoteDTO(
      id: playerId,
      // authId: playerAuthId,
      nickname: playerNickname,
      email: playerEmail,
    );

    return playerRemoteDTO;
  }

  factory PlayerRemoteDTO.fromJson(Map<String, dynamic> map) =>
      _$PlayerRemoteDTOFromJson(map);
}
