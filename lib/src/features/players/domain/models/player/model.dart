import 'package:five_on_4_flutter/src/features/players/data/dtos/player_remote/player_remote.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class PlayerModel with _$PlayerModel {
  const factory PlayerModel({
    required String id,
    required String userId,
    required String name,
  }) = _PlayerModel;

  factory PlayerModel.fromRemoteDTO(PlayerRemoteDTO dto) {
    final PlayerModel player = PlayerModel(
      id: dto.id,
      userId: dto.userId,
      name: dto.name,
    );

    return player;
  }
}
