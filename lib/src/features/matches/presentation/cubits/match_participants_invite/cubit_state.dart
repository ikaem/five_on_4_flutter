part of 'cubit.dart';

@freezed
class MatchParticipantsInviteCubitState
    with _$MatchParticipantsInviteCubitState {
  factory MatchParticipantsInviteCubitState.initial() =
      MatchParticipantsInviteCubitStateInitial;
  factory MatchParticipantsInviteCubitState.loading() =
      MatchParticipantsInviteCubitStateLoading;
  factory MatchParticipantsInviteCubitState.success(String matchId) =
      MatchParticipantsInviteCubitStateSuccess;
  factory MatchParticipantsInviteCubitState.failure({
    required String message,
  }) = MatchParticipantsInviteCubitStateFailure;
}
