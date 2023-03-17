part of 'cubit.dart';

@freezed
class MatchesInvitedGetCubitState with _$MatchesInvitedGetCubitState {
  const factory MatchesInvitedGetCubitState.matchesInvitedInitial() =
      MatchesInvitedGetCubitStateInitial;
  const factory MatchesInvitedGetCubitState.matchesInvitedLoading() =
      MatchesInvitedGetCubitStateLoading;
  const factory MatchesInvitedGetCubitState.matchesInvitedLoaded(
      List<MatchModel> matches) = MatchesInvitedGetCubitStateLoaded;
  const factory MatchesInvitedGetCubitState.matchesInvitedError(
    String message,
  ) = MatchesInvitedGetCubitStateError;
}
