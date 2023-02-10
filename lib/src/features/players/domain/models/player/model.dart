import 'package:five_on_4_flutter/src/features/players/data/dtos/player_remote/player_remote.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class PlayerModel with _$PlayerModel {
  const factory PlayerModel({
    required String id,
    required String authId,
    required String nickname,
    required String email,
  }) = _PlayerModel;

  factory PlayerModel.fromRemoteDTO(PlayerRemoteDTO dto) {
    final PlayerModel player = PlayerModel(
      id: dto.id,
      authId: dto.authId,
      nickname: dto.nickname,
      email: dto.email,
    );

    return player;
  }
}
