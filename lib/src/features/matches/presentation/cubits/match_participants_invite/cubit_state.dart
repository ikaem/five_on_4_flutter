part of 'cubit.dart';

@freezed
class MatchParticipantsInviteState with _$MatchParticipantsInviteState {
  factory MatchParticipantsInviteState.initial() =
      MatchParticipantsInviteStateInitial;
  factory MatchParticipantsInviteState.loading() =
      MatchParticipantsInviteStateLoading;
  factory MatchParticipantsInviteState.success(String matchId) =
      MatchParticipantsInviteStateSuccess;
  factory MatchParticipantsInviteState.failure({
    required String message,
  }) = MatchParticipantsInviteStateFailure;
}
