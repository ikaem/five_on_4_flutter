import 'package:five_on_4_flutter/src/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class MatchParticipantModel with _$MatchParticipantModel {
  const factory MatchParticipantModel({
    required String id,
    required String userId,
    required String nickname,
    required MatchParticipantStatus status,
    required int createdAt,
    required int? expiresAt,
  }) = _MatchParticipantModel;

  factory MatchParticipantModel.fromRemoteDTO(MatchParticipantRemoteDTO dto) {
    final MatchParticipantStatus status =
        MatchParticipantStatus.values.firstWhere(
      (status) {
        // TODO test
        return status.name == dto.status;
      },
      orElse: () => MatchParticipantStatus.unknown,
    );

    final MatchParticipantModel participant = MatchParticipantModel(
      id: dto.id,
      userId: dto.userId,
      nickname: dto.nickname,
      status: status,
      createdAt: dto.createdAt,
      expiresAt: dto.expiresAt,
    );

    return participant;
  }
}
