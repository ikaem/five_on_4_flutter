import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class MatchParticipantModel with _$MatchParticipantModel {
  const factory MatchParticipantModel({
    required String id,
    required String userId,
    required String nickname,
  }) = _MatchParticipantModel;

  factory MatchParticipantModel.fromRemoteDTO(MatchParticipantRemoteDTO dto) {
    final MatchParticipantModel participant = MatchParticipantModel(
      id: dto.id,
      userId: dto.userId,
      nickname: dto.nickname,
    );

    return participant;
  }
}
